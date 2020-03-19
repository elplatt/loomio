class AddHasReadGroupNoticeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :has_read_group_notice, :boolean, :default => false,
      :null => false
  end
end
