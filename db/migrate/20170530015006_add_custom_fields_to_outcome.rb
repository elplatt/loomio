class AddCustomFieldsToOutcome < ActiveRecord::Migration[5.2]
  def change
    add_column :outcomes, :custom_fields, :jsonb, default: {}, null: false
  end
end
