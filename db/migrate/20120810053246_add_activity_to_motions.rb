class AddActivityToMotions < ActiveRecord::Migration[5.2]
  def change
    add_column :motions, :activity, :integer, default: 0
  end
end
