class MembershipsRenameLastViewedAtToGroupLastViewedAt < ActiveRecord::Migration[5.2]
  def change
    rename_column :memberships, :last_viewed_at, :group_last_viewed_at
  end
end
