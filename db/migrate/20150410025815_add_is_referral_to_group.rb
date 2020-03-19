class AddIsReferralToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :is_referral, :boolean
    Group.reset_column_information
  end
end
