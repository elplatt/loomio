class RemoveIdentities < ActiveRecord::Migration[5.2]
  def change
    drop_table :identities
    add_column :omniauth_identities, :custom_fields, :jsonb, default: {}, null: false
  end
end
