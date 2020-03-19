class ConvertMotionBlockedToNewVote < ActiveRecord::Migration[5.2]
  def change
    Event.where(kind: 'motion_blocked').update_all(kind: 'new_vote')
  end
end
