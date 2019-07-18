class AddHasLongToDiscussion < ActiveRecord::Migration[5.2]
  def change
    add_column :discussions, :has_long, :boolean
  end
end
