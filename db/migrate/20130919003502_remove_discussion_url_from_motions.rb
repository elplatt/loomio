class RemoveDiscussionUrlFromMotions < ActiveRecord::Migration[5.2]
  def up
    remove_column :motions, :discussion_url
  end

  def down
    add_column :motions, :discussion_url, :string
  end
end
