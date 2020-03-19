class AddCloseDaterToMotions < ActiveRecord::Migration[5.2]
  def change
    add_column :motions, :close_date, :date
  end
end
