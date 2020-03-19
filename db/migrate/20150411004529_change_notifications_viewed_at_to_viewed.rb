class ChangeNotificationsViewedAtToViewed < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :viewed, :boolean, default: false, null: false
    add_index :notifications, :viewed
  end
end
