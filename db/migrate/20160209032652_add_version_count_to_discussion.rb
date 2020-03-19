class AddVersionCountToDiscussion < ActiveRecord::Migration[5.2]
  def change
    add_column :discussions, :versions_count, :integer, default: 0
  end
end
