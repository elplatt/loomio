class AddAvatarInitialsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar_initials, :string
  end
end
