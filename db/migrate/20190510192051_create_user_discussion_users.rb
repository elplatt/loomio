class CreateUserDiscussionUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_discussion_users do |t|
      t.integer :breakout
    end
  end
end
