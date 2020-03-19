class AddStatusToGroupRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :group_requests, :status, :string
  end
end
