class AddMaxSizeToGroupRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :group_requests, :max_size, :integer, default: 50
  end
end
