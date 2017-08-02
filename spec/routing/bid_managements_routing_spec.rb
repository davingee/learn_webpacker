require "rails_helper"

RSpec.describe BidManagementsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/bid_managements").to route_to("bid_managements#index")
    end

    it "routes to #new" do
      expect(:get => "/bid_managements/new").to route_to("bid_managements#new")
    end

    it "routes to #show" do
      expect(:get => "/bid_managements/1").to route_to("bid_managements#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/bid_managements/1/edit").to route_to("bid_managements#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/bid_managements").to route_to("bid_managements#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/bid_managements/1").to route_to("bid_managements#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/bid_managements/1").to route_to("bid_managements#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/bid_managements/1").to route_to("bid_managements#destroy", :id => "1")
    end

  end
end
