class ChangePaymentPlanDefault < ActiveRecord::Migration[5.2]
  def up
    change_column_default(:groups, :payment_plan, "undetermined")
  end

  def down
  end
end
