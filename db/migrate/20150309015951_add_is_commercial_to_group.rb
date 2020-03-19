class AddIsCommercialToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :is_commercial, :boolean
  end
end
