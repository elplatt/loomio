class ChangeMotionTypeToNonNullable < ActiveRecord::Migration[5.2]
  def up
    change_column_null("motions", "motion_type", false)
  end

  def down
    change_column_default("motions", "discussion_url", nil)
  end
end
