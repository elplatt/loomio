class RemoveDisableDiscussionFromMotions < ActiveRecord::Migration[5.2]
  def up
    remove_column :motions, :disable_discussion
  end

  def down
    add_column :motions, :disable_discussion, :boolean
  end
end
