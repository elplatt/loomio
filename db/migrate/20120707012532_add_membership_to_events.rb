class AddMembershipToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :membership_id, :integer
    add_index :events, :membership_id
  end
end
