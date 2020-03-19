class AddVersionsCountToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :versions_count, :integer, default: 0
  end
end
