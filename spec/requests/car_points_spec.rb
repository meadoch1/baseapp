require 'rails_helper'

RSpec.describe "CarPoints", :type => :request do
  describe "GET /car_points" do

    before do
      sign_in_as_a_valid_user
    end

    it "views the list" do
      get car_points_path
      expect(response).to have_http_status(200)
    end
  end
end
