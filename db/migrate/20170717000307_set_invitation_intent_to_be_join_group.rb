class SetInvitationIntentToBeJoinGroup < ActiveRecord::Migration[5.2]
  def change
    change_column :invitations, :intent, :string, null: false, default: 'join_group'
  end
end
