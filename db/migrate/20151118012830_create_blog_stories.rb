class CreateBlogStories < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_stories do |t|
      t.string :title
      t.string :url
      t.string :image_url
      t.datetime :published_at

      t.timestamps null: false
    end
  end
end
