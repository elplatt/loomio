class AddCanStartGroupToGroups < ActiveRecord::Migration[5.2]
  def up
    add_column :groups, :can_start_group, :boolean, default: true
  end

  def down
    remove_column :groups, :can_start_group
  end
end
