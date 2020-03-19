class AddBio < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :short_bio, :string, default: "", null: false
  end
end
