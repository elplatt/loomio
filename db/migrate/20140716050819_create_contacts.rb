class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.references :user
      t.string :name
      t.string :email
      t.string :source

      t.timestamps
    end
    add_index :contacts, :user_id
  end
end
