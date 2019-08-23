class AddBreakoutIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :breakout_id, :integer
  end
end
