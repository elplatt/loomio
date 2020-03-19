class ChangeStatementToReason < ActiveRecord::Migration[5.2]
  def change
    rename_column :stances, :statement, :reason
  end
end
