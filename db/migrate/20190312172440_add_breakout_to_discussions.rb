class AddBreakoutToDiscussions < ActiveRecord::Migration[5.2]
  def change
    add_column :discussions, :breakout, :boolean
  end
end
