class AddDiscussionUrlToMotions < ActiveRecord::Migration[5.2]
  def change
    add_column :motions, :discussion_url, :string
  end
end
