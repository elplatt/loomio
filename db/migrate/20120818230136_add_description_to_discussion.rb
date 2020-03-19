class AddDescriptionToDiscussion < ActiveRecord::Migration[5.2]
  def change
    add_column :discussions, :description, :text
  end
end
