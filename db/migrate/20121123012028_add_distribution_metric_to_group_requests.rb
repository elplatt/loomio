class AddDistributionMetricToGroupRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :group_requests, :distribution_metric, :integer
  end
end
