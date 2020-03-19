class AddTimestampsToGroupIdentity < ActiveRecord::Migration[5.2]
  def change
    add_column :group_identities, :created_at, :datetime, null: false
    add_column :group_identities, :updated_at, :datetime, null: false
  end
end
