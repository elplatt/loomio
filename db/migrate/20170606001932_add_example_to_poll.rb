class AddExampleToPoll < ActiveRecord::Migration[5.2]
  def change
    add_column :polls, :example, :boolean, default: false, null: false
  end
end
