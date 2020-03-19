class AddStanceData < ActiveRecord::Migration[5.2]
  def change
    add_column :polls, :stance_data, :jsonb, default: {}
  end
end
