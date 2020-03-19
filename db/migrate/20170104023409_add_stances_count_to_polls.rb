class AddStancesCountToPolls < ActiveRecord::Migration[5.2]
  def change
    add_column :polls, :stances_count, :integer, default: 0, null: false
  end
end
