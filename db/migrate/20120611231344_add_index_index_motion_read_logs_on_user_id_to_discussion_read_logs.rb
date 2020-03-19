class AddIndexIndexMotionReadLogsOnUserIdToDiscussionReadLogs < ActiveRecord::Migration[5.2]
  def change
    add_index "discussion_read_logs", ["user_id"], :name => "index_motion_read_logs_on_user_id"
  end
end
