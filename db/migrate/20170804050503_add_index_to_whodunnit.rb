class AddIndexToWhodunnit < ActiveRecord::Migration[5.2]
  def change
    add_index :versions, :whodunnit
  end
end
