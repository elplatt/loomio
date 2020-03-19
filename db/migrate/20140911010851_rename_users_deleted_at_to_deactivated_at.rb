class RenameUsersDeletedAtToDeactivatedAt < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :deleted_at, :deactivated_at
  end
end
