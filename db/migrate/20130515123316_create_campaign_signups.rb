class CreateCampaignSignups < ActiveRecord::Migration[5.2]
  def change
    create_table :campaign_signups do |t|
      t.references :campaign
      t.string :name
      t.string :email
      t.boolean :spam

      t.timestamps
    end
    add_index :campaign_signups, :campaign_id
  end
end
