class RemoveNetworks < ActiveRecord::Migration[5.2]
  def change
    drop_table :networks
    drop_table :network_memberships
    drop_table :network_membership_requests
  end
end
