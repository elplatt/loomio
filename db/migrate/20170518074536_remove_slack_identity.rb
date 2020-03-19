class RemoveSlackIdentity < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :slack_identity_id, :integer
  end
end
