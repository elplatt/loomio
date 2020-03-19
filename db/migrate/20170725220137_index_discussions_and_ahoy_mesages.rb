class IndexDiscussionsAndAhoyMesages < ActiveRecord::Migration[5.2]
  def change
    add_index :discussions, [:is_deleted, :archived_at, :private], name: :index_discussions_visible
  end
end
