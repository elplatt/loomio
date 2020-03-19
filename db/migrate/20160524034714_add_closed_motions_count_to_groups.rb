class AddClosedMotionsCountToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :discussions, :closed_motions_count, :integer, default: 0, null: false
    add_column :groups,      :closed_motions_count, :integer, default: 0, null: false
  end
end
