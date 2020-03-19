class RenameWocoptionsToCampaigns < ActiveRecord::Migration[5.2]
  def change
    rename_table :woc_options, :campaigns
  end
end
