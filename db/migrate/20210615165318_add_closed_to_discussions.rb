class AddClosedToDiscussions < ActiveRecord::Migration[5.2]
  def change
    add_column :discussions, :closed, :boolean
  end
end
