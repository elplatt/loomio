class AddExperiencesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :experiences, :jsonb, null: false, default: {}
  end
end
