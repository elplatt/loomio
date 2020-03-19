class AddAnalyticsEnabled < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :analytics_enabled, :boolean, default: false, null: false
  end
end
