class RecountEverythingAgain < ActiveRecord::Migration[5.2]
  def change
    DiscussionService.recount_everything!
  end
end
