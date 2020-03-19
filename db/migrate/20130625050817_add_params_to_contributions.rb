class AddParamsToContributions < ActiveRecord::Migration[5.2]
  def change
    add_column :contributions, :params, :text
  end
end
