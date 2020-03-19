class AddPayingSubscriptionToGroupRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :group_requests, :paying_subscription, :boolean
  end
end
