class RemoveFacilitatorFromMotions < ActiveRecord::Migration[5.2]
  def up
    remove_column :motions, :facilitator_id
  end

  def down
    add_column :motions, :facilitator_id
  end
end
