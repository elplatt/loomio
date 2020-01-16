class AddTreatmentToBreakouts < ActiveRecord::Migration[5.2]
  def change
    add_column :breakouts, :treatment, :integer
  end
end
