class DropNetworkCoordinators < ActiveRecord::Migration[5.2]
  def change
    drop_table :network_coordinators
  end
end
