class AddSlackCommunityToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :slack_identity_id, :integer, null: true, index: true
  end
end
