class AddCommentToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :comment_id, :integer
    add_index :events, :comment_id
  end
end
