class AddIndexToInvitations < ActiveRecord::Migration[5.2]
  def change
    add_index :invitations, [:invitable_type, :invitable_id]
  end
end
