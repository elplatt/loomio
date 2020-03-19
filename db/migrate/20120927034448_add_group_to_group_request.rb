class AddGroupToGroupRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :group_requests, :group_id, :integer
    add_index :group_requests, :group_id
  end
end
