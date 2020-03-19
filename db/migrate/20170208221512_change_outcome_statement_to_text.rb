class ChangeOutcomeStatementToText < ActiveRecord::Migration[5.2]
  def change
    change_column :outcomes, :statement, :text
  end
end
