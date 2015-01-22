require "rails_helper"

RSpec.describe CarPointsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/car_points").to route_to("car_points#index")
    end

    it "routes to #new" do
      expect(:get => "/car_points/new").to route_to("car_points#new")
    end

    it "routes to #show" do
      expect(:get => "/car_points/1").to route_to("car_points#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/car_points/1/edit").to route_to("car_points#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/car_points").to route_to("car_points#create")
    end

    it "routes to #update" do
      expect(:put => "/car_points/1").to route_to("car_points#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/car_points/1").to route_to("car_points#destroy", :id => "1")
    end

  end
end
