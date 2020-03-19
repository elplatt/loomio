class DeleteDanglingLikes < ActiveRecord::Migration[5.2]
  def up
    CommentVote.find_each do |cv|
      cv.destroy if cv.user.nil?
    end
  end

  def down
  end
end
