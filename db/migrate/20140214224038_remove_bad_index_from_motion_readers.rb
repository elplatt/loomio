class RemoveBadIndexFromMotionReaders < ActiveRecord::Migration[5.2]
  def change
    remove_index :motion_readers, :name => "index_motion_readers_on_user_id_and_motion_id_and_created_at"
  end
end
