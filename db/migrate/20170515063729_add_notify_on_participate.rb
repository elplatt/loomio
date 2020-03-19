class AddNotifyOnParticipate < ActiveRecord::Migration[5.2]
  def change
    add_column :polls, :notify_on_participate, :boolean, default: false, null: false
  end
end
