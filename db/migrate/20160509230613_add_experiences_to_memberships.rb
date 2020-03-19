class AddExperiencesToMemberships < ActiveRecord::Migration[5.2]
  def change
    add_column :memberships, :experiences, :jsonb, null: false, default: {}
  end
end
