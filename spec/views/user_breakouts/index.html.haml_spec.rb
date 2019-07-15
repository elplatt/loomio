require 'rails_helper'

RSpec.describe "user_breakouts/index", type: :view do
  before(:each) do
    assign(:user_breakouts, [
      UserBreakout.create!(
        :user_id => 2,
        :breakout_id => 3
      ),
      UserBreakout.create!(
        :user_id => 2,
        :breakout_id => 3
      )
    ])
  end

  it "renders a list of user_breakouts" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
