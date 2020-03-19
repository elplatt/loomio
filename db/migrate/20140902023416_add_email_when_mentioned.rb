class AddEmailWhenMentioned < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email_when_mentioned, :boolean, default: true, null: false
  end
end
