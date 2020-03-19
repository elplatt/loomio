class OneMoreNotificationsMirgation < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :viewed_at
  end
end
