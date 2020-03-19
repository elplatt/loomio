class AddStanceCounts < ActiveRecord::Migration[5.2]
  def change
    add_column :polls, :stance_counts, :jsonb, null: false, default: []
  end
end
