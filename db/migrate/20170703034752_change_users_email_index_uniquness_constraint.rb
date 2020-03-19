class ChangeUsersEmailIndexUniqunessConstraint < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, :email
    add_index :users, :email, name: "index_email_verified", where: '(email_verified is TRUE)'
  end
end
