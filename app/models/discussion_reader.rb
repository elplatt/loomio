class DiscussionReader < ApplicationRecord
  include CustomCounterCache::Model
  include HasVolume

  belongs_to :user
  belongs_to :discussion

  delegate :update_importance, to: :discussion
  delegate :importance, to: :discussion
  delegate :message_channel, to: :user

  update_counter_cache :discussion, :seen_by_count

  after_create do |discussion_reader|
    if not user.is_admin and not user.username == 'loomiohelperbot'
      if treatment == Discussion::SingleGroup
        Breakout.single_for(discussion: discussion, stage: discussion.num_stages)
      elsif treatment == Discussion::RandomNet
        Breakout.random_for(discussion: discussion, sequence: sequence, stage: discussion.num_stages)
      else
        Breakout.for(discussion: self.discussion, stage: discussion.num_stages, user: discussion_reader.user)
      end
    end
  end

  def self.for(user:, discussion:)
    if user&.is_logged_in?
      begin
        user_discussion = find_by(user: user, discussion: discussion)
        if user_discussion.nil?
          next_treatment = discussion.treatment_assignment
          next_sequence = DiscussionReader.joins(:user).where(discussion_id:discussion.id, treatment:next_treatment).where("users.is_admin=false").length
          user_discussion = create(user: user, discussion: discussion, sequence: next_sequence, treatment:next_treatment)
        end
        user_discussion
      rescue ActiveRecord::RecordNotUnique
        retry
      end
    else
      new(discussion: discussion)
    end
  end

  def self.for_model(model, actor = nil)
    self.for(user: actor || model.author, discussion: model.discussion)
  end

  def update_reader(ranges: nil, volume: nil, participate: false, dismiss: false)
    viewed!(ranges, persist: false)     if ranges
    set_volume!(volume, persist: false) if volume && (volume != :loud || user.email_on_participation?)
    dismiss!(persist: false)            if dismiss
    save!                               if changed?
    self
  end

  def viewed!(ranges = [], persist: true)
    mark_as_read(ranges) unless has_read?(ranges)
    assign_attributes(last_read_at: Time.now)
    save if persist
  end

  def has_read?(ranges = [])
    RangeSet.includes?(read_ranges, ranges)
  end

  def mark_as_read(ranges)
    ranges = RangeSet.to_ranges(ranges)
    return if ranges.empty?
    self.read_ranges = read_ranges.concat(ranges)
  end

  def dismiss!(persist: true)
    self.dismissed_at = Time.zone.now
    save if persist
  end

  def recall!(persist: true)
    self.dismissed_at = nil
    save if persist
  end

  def computed_volume
    if persisted?
      volume || membership&.volume || 'normal'
    else
      membership.volume
    end
  end

  def discussion_reader_volume
    self[:volume]
  end

  def read_ranges
    RangeSet.parse(self.read_ranges_string)
  end

  def read_ranges=(ranges)
    ranges = RangeSet.reduce(ranges)
    self.read_ranges_string = RangeSet.serialize(ranges)
  end

  # maybe yagni, because the client should do this locally
  def unread_ranges
    RangeSet.subtract_ranges(discussion.ranges, read_ranges)
  end

  def read_ranges_string
    self[:read_ranges_string] ||= begin
      if last_read_sequence_id == 0
        ""
      else
        "#{[discussion.first_sequence_id, 1].max}-#{last_read_sequence_id}"
      end
    end
  end

  def read_items_count
    RangeSet.length(read_ranges)
  end

  def polls_completed
    User.joins(:stances).joins(:discussions).where(users: {id: user_id}, discussions: {id: discussion_id}).length
  end

  private
  def membership
    @membership ||= discussion.group.membership_for(user)
  end
end
