class AddViewableByToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :viewable_by, :string
  end
end
