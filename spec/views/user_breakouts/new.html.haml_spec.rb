require 'rails_helper'

RSpec.describe "user_breakouts/new", type: :view do
  before(:each) do
    assign(:user_breakout, UserBreakout.new(
      :user_id => 1,
      :breakout_id => 1
    ))
  end

  it "renders new user_breakout form" do
    render

    assert_select "form[action=?][method=?]", user_breakouts_path, "post" do

      assert_select "input[name=?]", "user_breakout[user_id]"

      assert_select "input[name=?]", "user_breakout[breakout_id]"
    end
  end
end
