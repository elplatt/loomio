class RemoveCreatorFromGroups < ActiveRecord::Migration[5.2]
  def up
    remove_column :groups, :creator_id
  end

  def down
    add_column :groups, :creator_id, :integer
  end
end
