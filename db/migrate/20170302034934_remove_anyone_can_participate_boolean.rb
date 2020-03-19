class RemoveAnyoneCanParticipateBoolean < ActiveRecord::Migration[5.2]
  def change
    remove_column :polls, :anyone_can_participate
  end
end
