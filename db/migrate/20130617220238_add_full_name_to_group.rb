class AddFullNameToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :full_name, :string
    add_index :groups, :full_name
  end
end
