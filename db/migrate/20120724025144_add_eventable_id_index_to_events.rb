class AddEventableIdIndexToEvents < ActiveRecord::Migration[5.2]
  def up
    add_index :events, :eventable_id
  end

  def down
    remove_index :events, :column => :eventable_id
  end
end
