class AddSoftDrafts < ActiveRecord::Migration[5.2]
  def change
    create_table :drafts do |t|
      t.belongs_to :user
      t.belongs_to :draftable, polymorphic: true
      t.json :payload, default: {}, null: false
    end
  end
end
