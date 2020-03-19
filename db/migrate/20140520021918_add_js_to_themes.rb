class AddJsToThemes < ActiveRecord::Migration[5.2]
  def change
    add_column :themes, :javascript, :text
  end
end
