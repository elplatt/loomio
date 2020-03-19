class AddMaxSizeToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :max_size, :integer
  end
end
