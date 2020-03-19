class AddMembersInvitableByToGroups < ActiveRecord::Migration[5.2]
  class Group < ActiveRecord::Base
  end
  def up
    add_column :groups, :members_invitable_by, :string

    Group.reset_column_information
    Group.all.each do |group|
      group.members_invitable_by = :admins
      group.save
    end
  end

  def down
    remove_column :groups, :members_invitable_by, :string
  end
end
