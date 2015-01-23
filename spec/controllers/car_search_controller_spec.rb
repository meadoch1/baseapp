require 'rails_helper'

RSpec.describe CarSearchController, :type => :controller do

  context 'with an admin' do
    login_admin

    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

  context 'with a non-admin' do
    login_user

    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

end
