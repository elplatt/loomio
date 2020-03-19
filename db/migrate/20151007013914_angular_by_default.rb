class AngularByDefault < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :angular_ui_enabled, :boolean, default: true, null: false
  end
end
