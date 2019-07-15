
require 'test_helper'
 
class BreakoutTest < ActiveSupport::TestCase

  test "stage 0" do
    groups = []
    (0..14).each do |sequence|
        groups << Breakout.group_for(stage:0, sequence:sequence, team_size:2)[:group]
    end
    assert groups == [0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7]
  end

  test "stage 1" do
    groups = []
    remainders = []
    (0..14).each do |sequence|
        data = Breakout.group_for(stage:1, sequence:sequence, team_size:2) 
        groups << data[:group]
        remainders << data[:remainder]
    end
    assert groups == [0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2]
    assert remainders == [0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2]
  end
  
end