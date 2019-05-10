class AddStageToStances < ActiveRecord::Migration[5.2]
  def change
    add_column :stances, :stage, :integer
  end
end
