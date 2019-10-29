class Breakout < ApplicationRecord

    STAGE_PRIMES = [0, 2, 3, 5, 7, 11, 13, 17, 19, 23]
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
        # See if breakout already exists for user/discussion/stage
        breakout = user.breakouts.find_by(discussion: discussion, stage: stage)
        if breakout.nil?
            # Breakout not assigned yet, get group and remainder for current user/discussion/stage
            sequence = discussion.discussion_readers.find_by(user: user).sequence
            g = group_for(stage: stage, sequence: sequence, team_size: TEAM_SIZE)
            breakout = find_by(discussion:discussion, stage: stage, remainder: g[:remainder], group: g[:group])
            # If the breakout does not exist, create it
            if breakout.nil?
                breakout = create(discussion:discussion, stage: stage, prime: g[:p], remainder: g[:remainder], group: g[:group])
            end
            breakout.users << user
        end
        breakout
    end
end
