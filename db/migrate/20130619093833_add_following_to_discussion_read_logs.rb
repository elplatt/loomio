class AddFollowingToDiscussionReadLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :discussion_read_logs, :following, :boolean, default: true, null: false
  end
end
