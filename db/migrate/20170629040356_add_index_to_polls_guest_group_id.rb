class AddIndexToPollsGuestGroupId < ActiveRecord::Migration[5.2]
  def change
    add_index :polls, :guest_group_id, unique: true
  end
end
