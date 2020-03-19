class AddRecipientIdToEmails < ActiveRecord::Migration[5.2]
  def change
    add_column :emails, :recipient_id, :integer
    add_index :emails, :recipient_id
  end
end
