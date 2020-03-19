class AddIndexGroupIdToPolls < ActiveRecord::Migration[5.2]
  def change
    add_index :polls, :group_id
  end
end
