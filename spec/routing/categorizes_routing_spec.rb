require "rails_helper"

RSpec.describe CategorizesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/categorizes").to route_to("categorizes#index")
    end

    it "routes to #new" do
      expect(:get => "/categorizes/new").to route_to("categorizes#new")
    end

    it "routes to #show" do
      expect(:get => "/categorizes/1").to route_to("categorizes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/categorizes/1/edit").to route_to("categorizes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/categorizes").to route_to("categorizes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/categorizes/1").to route_to("categorizes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/categorizes/1").to route_to("categorizes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/categorizes/1").to route_to("categorizes#destroy", :id => "1")
    end

  end
end
