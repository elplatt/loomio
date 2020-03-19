class RenameCampaignsExampleDiscussionUrlToShowcaseUrl < ActiveRecord::Migration[5.2]
  def change
    rename_column :campaigns, :example_discussion_url, :showcase_url
  end
end
