class AddTreatmentToDiscussionReader < ActiveRecord::Migration[5.2]
  def change
    add_column :discussion_readers, :treatment, :integer
  end
end
