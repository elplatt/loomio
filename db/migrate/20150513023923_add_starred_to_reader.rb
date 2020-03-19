class AddStarredToReader < ActiveRecord::Migration[5.2]
  def change
    add_column :discussion_readers, :starred, :boolean, default: false, null: false
  end
end
