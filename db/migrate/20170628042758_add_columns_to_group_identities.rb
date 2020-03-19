class AddColumnsToGroupIdentities < ActiveRecord::Migration[5.2]
  def change
    add_column :group_identities, :channel_name, :string
    add_column :group_identities, :channel_id, :string
  end
end
