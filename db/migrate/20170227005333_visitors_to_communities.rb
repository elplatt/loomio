class VisitorsToCommunities < ActiveRecord::Migration[5.2]
  def change
    rename_column :visitors, :poll_id, :community_id
  end
end
