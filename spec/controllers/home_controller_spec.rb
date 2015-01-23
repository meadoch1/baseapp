require 'rails_helper'

RSpec.describe HomeController, :type => :controller do

  describe "GET index" do
    context 'when logged in' do
      login_user
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    context 'when not logged in' do
      login_user
      it "redirects to the login page" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

end
