class AddNextStepsCompletedToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :next_steps_completed, :boolean, :default => false, :null => false
  end
end
