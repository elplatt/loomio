class AddPrivacyToDiscussions < ActiveRecord::Migration[5.2]
  def change
    add_column :discussions, :private, :boolean, null: true
  end
end
