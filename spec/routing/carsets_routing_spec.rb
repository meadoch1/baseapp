require "rails_helper"

RSpec.describe CarsetsController, :type => :routing do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "/carsets/new").to route_to("carsets#new")
    end

    it "routes to #create" do
      expect(:post => "/carsets").to route_to("carsets#create")
    end
  end
end
