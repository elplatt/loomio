class AddColumnsToBreakout < ActiveRecord::Migration[5.2]
  def change
    add_column :breakouts, :stage, :integer
    add_column :breakouts, :prime, :integer
    add_column :breakouts, :remainder, :integer
    add_column :breakouts, :group, :integer
  end
end
