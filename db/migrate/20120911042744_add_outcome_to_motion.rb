class AddOutcomeToMotion < ActiveRecord::Migration[5.2]
  def change
    add_column :motions, :outcome, :string
  end
end
