require 'rails_helper'

RSpec.describe "Carsets", :type => :request do
  describe "GET /carsets" do
    it "works! (now write some real specs)" do
      get carsets_path
      expect(response).to have_http_status(200)
    end
  end
end
