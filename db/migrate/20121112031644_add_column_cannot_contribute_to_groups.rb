class AddColumnCannotContributeToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :cannot_contribute, :boolean, default: false
  end
end
