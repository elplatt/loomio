class AddMembersCanEditOwnMotionsToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :members_can_edit_own_motions, :boolean, default: true, null: false
  end
end
