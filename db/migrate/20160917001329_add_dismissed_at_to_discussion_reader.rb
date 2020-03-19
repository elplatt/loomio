class AddDismissedAtToDiscussionReader < ActiveRecord::Migration[5.2]
  def change
    add_column :discussion_readers, :dismissed_at, :datetime
  end
end
