class ChangeMotionOutcomeToText < ActiveRecord::Migration[5.2]
  def change
    change_column :motions, :outcome, :text
  end
end
