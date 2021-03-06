class RemoveAcceptedStatusFromGroupRequests < ActiveRecord::Migration[5.2]
  class GroupRequest < ActiveRecord::Base
  end

  def up
    GroupRequest.where(status: :accepted).update_all(status: :approved)
  end

  def down
  end
end
