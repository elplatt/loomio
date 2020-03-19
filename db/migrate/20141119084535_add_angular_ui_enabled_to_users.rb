class AddAngularUiEnabledToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :angular_ui_enabled, :boolean, default: false, null: false
  end
end
