class AddMembershipsIndexWtf < ActiveRecord::Migration[5.2]
  def change
    add_index :memberships, [:group_id, :user_id, :is_suspended, :archived_at], name: :active_memberships
  end
end
