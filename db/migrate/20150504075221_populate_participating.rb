class PopulateParticipating < ActiveRecord::Migration[5.2]
  class DiscussionService
    define_singleton_method :mark_as_participating!, ->{}
  end

  def up
    DiscussionService.mark_as_participating!
  end

  def down
  end
end
