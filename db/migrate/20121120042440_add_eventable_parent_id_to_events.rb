class AddEventableParentIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :discussion_id, :integer
  end
end
