class ChangeEmailOnParticipationToTrue < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :email_on_participation, :boolean, default: true, null: false
  end
end
