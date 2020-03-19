class RemoveHelpNoticesFromUser < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :has_read_discussion_notice
    remove_column :users, :has_read_group_notice
    remove_column :users, :has_read_dashboard_notice
  end

  def down
    add_column :users, :has_read_discussion_notice, :boolean, :default => false, :null => false
    add_column :users, :has_read_group_notice, :boolean, :default => false, :null => false
    add_column :users, :has_read_dashboard_notice, :boolean, :default => false, :null => false
  end
end
