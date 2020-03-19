class AddSubgroupsCountToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :subgroups_count, :integer, null: false, default: 0
  end
end
