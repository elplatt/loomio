class RenameLanguagePreferenceToLocale < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :language_preference, :selected_locale
    add_column :users, :detected_locale, :string
  end
end
