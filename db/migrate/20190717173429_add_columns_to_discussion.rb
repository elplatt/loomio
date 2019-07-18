class AddColumnsToDiscussion < ActiveRecord::Migration[5.2]
  def change
    add_column :discussions, :has_single_group, :boolean
    add_column :discussions, :has_random_network, :boolean
    add_column :discussions, :has_short_path_network, :boolean
  end
end
