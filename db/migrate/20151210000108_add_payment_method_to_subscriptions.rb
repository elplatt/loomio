class AddPaymentMethodToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :payment_method, :string, null: false, default: 'chargify'
  end
end
