class AddEmailAPIKeyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email_api_key, :string
  end
end
