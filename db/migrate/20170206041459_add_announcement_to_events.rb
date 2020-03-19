class AddAnnouncementToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :announcement, :boolean, null: false, default: false
  end
end
