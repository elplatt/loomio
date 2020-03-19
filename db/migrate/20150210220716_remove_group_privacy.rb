class RemoveGroupPrivacy < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :privacy
  end
end
