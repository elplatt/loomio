class AddIndexIndexGroupsOnParentIdToGroups < ActiveRecord::Migration[5.2]
  def change
    add_index "groups", ["parent_id"], :name => "index_groups_on_parent_id"
  end
end
