require "rails_helper"

RSpec.describe BillListsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/bill_lists").to route_to("bill_lists#index")
    end

    it "routes to #new" do
      expect(:get => "/bill_lists/new").to route_to("bill_lists#new")
    end

    it "routes to #show" do
      expect(:get => "/bill_lists/1").to route_to("bill_lists#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/bill_lists/1/edit").to route_to("bill_lists#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/bill_lists").to route_to("bill_lists#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/bill_lists/1").to route_to("bill_lists#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/bill_lists/1").to route_to("bill_lists#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/bill_lists/1").to route_to("bill_lists#destroy", :id => "1")
    end
  end
end
