class AddPublicDiscussionsCount < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :public_discussions_count, :integer, null: false, default: 0
  end
end
