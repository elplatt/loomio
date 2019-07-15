require 'rails_helper'

RSpec.describe "user_breakouts/show", type: :view do
  before(:each) do
    @user_breakout = assign(:user_breakout, UserBreakout.create!(
      :user_id => 2,
      :breakout_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
