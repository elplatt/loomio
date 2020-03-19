class AddArchivedAtToDiscussions < ActiveRecord::Migration[5.2]
  def change
    add_column :discussions, :archived_at, :timestamp, :default => nil
  end
end
