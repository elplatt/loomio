class AddApprovedByToGroupRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :group_requests, :approved_by_id, :integer
  end
end
