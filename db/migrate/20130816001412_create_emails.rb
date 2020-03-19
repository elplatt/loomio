class CreateEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :emails do |t|
      t.string :to
      t.string :from
      t.string :reply_to
      t.string :subject
      t.string :language
      t.text :body

      t.timestamps
    end
  end
end
