class AddSequenceToDiscussionReaders < ActiveRecord::Migration[5.2]
  def change
    add_column :discussion_readers, :sequence, :integer
  end
end
