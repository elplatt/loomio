class AddParentToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :parent_id, :integer
  end
end
