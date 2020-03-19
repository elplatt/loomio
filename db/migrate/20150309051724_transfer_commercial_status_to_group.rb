class TransferCommercialStatusToGroup < ActiveRecord::Migration[5.2]
  def change
    Group.joins(:group_request).where('group_requests.is_commercial = TRUE').update_all(is_commercial: true)
  end
end
