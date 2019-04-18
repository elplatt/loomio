class CreateBreakouts < ActiveRecord::Migration[5.2]
  def change
    create_table :breakouts do |t|

      t.timestamps
    end
  end
end
