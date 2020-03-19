class RemoveActorTypeIdFromNotifications < ActiveRecord::Migration[5.2]
  def change
    Notification.where(actor_type: 'Visitor').delete_all
    remove_column :notifications, :actor_type, :string, limit: 255
  end
end
