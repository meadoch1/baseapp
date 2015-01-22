require 'rails_helper'

RSpec.describe "CarPoints", :type => :request do
  describe "GET /car_points" do
    it "works! (now write some real specs)" do
      get car_points_path
      expect(response).to have_http_status(200)
    end
  end
end
