class AddCustomFieldsToPolls < ActiveRecord::Migration[5.2]
  def change
    add_column :polls, :custom_fields, :jsonb, null: false, default: {}
  end
end
