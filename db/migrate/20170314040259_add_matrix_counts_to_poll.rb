class AddMatrixCountsToPoll < ActiveRecord::Migration[5.2]
  def change
    add_column :polls, :matrix_counts, :jsonb, default: [], null: false
  end
end
