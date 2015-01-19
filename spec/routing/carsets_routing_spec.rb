require "rails_helper"

RSpec.describe CarsetsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/carsets").to route_to("carsets#index")
    end

    it "routes to #new" do
      expect(:get => "/carsets/new").to route_to("carsets#new")
    end

    it "routes to #show" do
      expect(:get => "/carsets/1").to route_to("carsets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/carsets/1/edit").to route_to("carsets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/carsets").to route_to("carsets#create")
    end

    it "routes to #update" do
      expect(:put => "/carsets/1").to route_to("carsets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/carsets/1").to route_to("carsets#destroy", :id => "1")
    end

  end
end
