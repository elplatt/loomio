require 'rails_helper'

RSpec.describe "user_breakouts/edit", type: :view do
  before(:each) do
    @user_breakout = assign(:user_breakout, UserBreakout.create!(
      :user_id => 1,
      :breakout_id => 1
    ))
  end

  it "renders the edit user_breakout form" do
    render

    assert_select "form[action=?][method=?]", user_breakout_path(@user_breakout), "post" do

      assert_select "input[name=?]", "user_breakout[user_id]"

      assert_select "input[name=?]", "user_breakout[breakout_id]"
    end
  end
end
