class AddReferrerToLoginTokens < ActiveRecord::Migration[5.2]
  def change
    add_column :login_tokens, :redirect, :string, null: true
  end
end
