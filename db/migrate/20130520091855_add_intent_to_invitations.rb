class AddIntentToInvitations < ActiveRecord::Migration[5.2]
  def up
    add_column :invitations, :intent, :string
  end

  def down
    remove_column :invitations, :intent
  end
end
