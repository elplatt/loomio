class RemoveStars < ActiveRecord::Migration[5.2]
  def change
    remove_column :discussion_readers, :starred, :boolean
  end
end
