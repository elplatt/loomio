class AddBetaFeaturesToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :beta_features, :boolean, :default => false
  end
end
