class AddDiscussionToBreakouts < ActiveRecord::Migration[5.2]
  def change
    add_reference :breakouts, :discussion, foreign_key: true
  end
end
