class RemoveContributions < ActiveRecord::Migration[5.2]
  def change
    drop_table :contributions
  end
end
