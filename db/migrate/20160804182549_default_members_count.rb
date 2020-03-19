class DefaultMembersCount < ActiveRecord::Migration[5.2]
  def change
    change_column :motions, :members_count, :integer, default: 0, null: false
  end
end
