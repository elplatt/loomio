class AddVisitorCountToPolls < ActiveRecord::Migration[5.2]
  def change
    add_column :polls, :visitors_count, :integer, null: false, default: 0
  end
end
