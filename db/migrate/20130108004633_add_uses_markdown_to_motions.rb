class AddUsesMarkdownToMotions < ActiveRecord::Migration[5.2]
  def up
    add_column :motions, :uses_markdown, :boolean, default: true, null: false
    change_column :motions, :uses_markdown, :boolean, default: false, null: false
  end

  def down
    remove_column :motions, :uses_markdown
  end
end
