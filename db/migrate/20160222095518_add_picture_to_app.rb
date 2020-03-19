class AddPictureToApp < ActiveRecord::Migration[5.2]
  def change
    add_attachment :oauth_applications, :logo
  end
end
