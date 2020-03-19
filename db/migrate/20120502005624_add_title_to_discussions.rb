class AddTitleToDiscussions < ActiveRecord::Migration[5.2]
  def change
    add_column :discussions, :title, :string
  end
end
