class AddIndexToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_index :notifications, :viewed_at
  end
end
