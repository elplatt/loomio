class CreateUserBreakouts < ActiveRecord::Migration[5.2]
  def change
    create_table :user_breakouts do |t|
      t.integer :user_id
      t.integer :breakout_id

      t.timestamps
    end
  end
end
