class RemoveMeasurements < ActiveRecord::Migration[5.2]
  def change
    drop_table :group_measurements
  end
end
