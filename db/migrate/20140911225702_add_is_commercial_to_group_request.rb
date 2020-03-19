class AddIsCommercialToGroupRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :group_requests, :is_commercial, :boolean
  end
end
