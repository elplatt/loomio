class AddVoteToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :vote_id, :integer
    add_index :events, :vote_id
  end
end
