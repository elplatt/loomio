class Breakout < ApplicationRecord
    has_one :discussion
    has_one :poll
end
