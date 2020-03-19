class AddLatestToOutcomes < ActiveRecord::Migration[5.2]
  def change
    add_column :outcomes, :latest, :boolean, default: true, null: false
  end
end
