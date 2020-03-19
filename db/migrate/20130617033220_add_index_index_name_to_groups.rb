class AddIndexIndexNameToGroups < ActiveRecord::Migration[5.2]
  def change
    add_index "groups", ["name"], :name => "index_groups_on_name"
  end
end
