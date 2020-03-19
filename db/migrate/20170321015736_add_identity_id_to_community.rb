class AddIdentityIdToCommunity < ActiveRecord::Migration[5.2]
  def change
    add_column :communities, :identity_id, :integer, null: true
  end
end
