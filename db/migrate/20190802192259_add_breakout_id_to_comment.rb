class AddBreakoutIdToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :breakout_id, :integer
  end
end
