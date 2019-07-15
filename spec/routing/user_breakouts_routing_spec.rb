require "rails_helper"

RSpec.describe UserBreakoutsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/user_breakouts").to route_to("user_breakouts#index")
    end

    it "routes to #new" do
      expect(:get => "/user_breakouts/new").to route_to("user_breakouts#new")
    end

    it "routes to #show" do
      expect(:get => "/user_breakouts/1").to route_to("user_breakouts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user_breakouts/1/edit").to route_to("user_breakouts#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/user_breakouts").to route_to("user_breakouts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/user_breakouts/1").to route_to("user_breakouts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/user_breakouts/1").to route_to("user_breakouts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_breakouts/1").to route_to("user_breakouts#destroy", :id => "1")
    end
  end
end
