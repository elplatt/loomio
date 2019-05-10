class AddBreakoutToDiscussions < ActiveRecord::Migration[5.2]
  def change
    add_column :discussions, :num_breakouts, :integer
    add_column :discussions, :has_random, :boolean
    add_column :discussions, :has_short, :boolean
    add_column :discussions, :has_all, :boolean
    add_column :discussions, :num_stages, :integer
    add_column :discussions, :current_stage, :integer
  end
end
