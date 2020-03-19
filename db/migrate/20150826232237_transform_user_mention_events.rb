class TransformUserMentionEvents < ActiveRecord::Migration[5.2]
  def up
    ActiveRecord::Base.connection.execute "UPDATE events SET user_id = comments.user_id FROM comments WHERE kind = 'user_mentioned' and eventable_id = comments.id"
  end
end
