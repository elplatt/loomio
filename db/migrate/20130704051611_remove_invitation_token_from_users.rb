class RemoveInvitationTokenFromUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :invitation_token
  end

  def down
    add_column :users, :invitation_token, :string
  end
end
