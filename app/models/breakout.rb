class Breakout < ApplicationRecord

    STAGE_PRIMES = [0, 3, 5, 7, 11, 13, 17, 19, 23]
    TEAM_SIZE = 2

    belongs_to :discussion
    has_and_belongs_to_many :users, through: :breakouts_users

    def self.group_for(stage:, sequence:, team_size:)
        if stage == 0
            group = (sequence / team_size).floor
            p = 0
            remainder = 0
        else
            # Find prime for current breakout stage
            p = STAGE_PRIMES[stage]
            # Find the remainder for the user's sequence number
            # Breakout members all have the same remainder
            remainder = sequence % p
            # Breakouts are divided into groups based on their quotient
            quotient = (sequence / p).floor
            group = (quotient / team_size).floor
        end
        { :group => group, :p => p, :remainder => remainder }
    end

    def self.for(discussion:, stage:, user:)
        breakout = user.breakouts.find_by(discussion: discussion, stage: stage)
        if breakout.nil?
            sequence = discussion.discussion_readers.find_by(user: user).sequence
            g = group_for(stage: stage, sequence: sequence, team_size: TEAM_SIZE)
            breakout = find_by(discussion:g[:discussion], stage: g[:stage], prime: g[:p], remainder: g[:remainder], group: g[:group])
        end
        if breakout.nil?
            breakout = create(discussion:discussion, stage: stage, prime: p, remainder: remainder, group: group)
        end
        breakout.users << user
        breakout
    end
end
