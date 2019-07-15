class CreateJoinTableUserBreakout < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :breakouts do |t|
      # t.index [:user_id, :breakout_id]
      # t.index [:breakout_id, :user_id]
    end
  end
end
