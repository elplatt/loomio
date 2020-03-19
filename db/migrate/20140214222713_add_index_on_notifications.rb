class AddIndexOnNotifications < ActiveRecord::Migration[5.2]
  def change
    add_index :notifications, [:event_id, :user_id]
  end
end
