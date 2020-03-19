class AddIdentifierToCommunities < ActiveRecord::Migration[5.2]
  def change
    add_column :communities, :identifier, :string, null: true, index: true
  end
end
