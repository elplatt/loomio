class AddStatementToVotes < ActiveRecord::Migration[5.2]
  def change
    add_column :votes, :statement, :string
  end
end
