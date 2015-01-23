require 'rails_helper'

RSpec.describe CarsetsController, :type => :controller do

  context 'with a non-admin user' do

    login_user

    describe "GET new" do
      it "redirects to the root path" do
        get :new, {}
        expect(response).to redirect_to(root_url)
      end
    end

    describe "POST create" do
      let(:file) {fixture_file_upload('data/carset.csv', 'text/csv')   }
      let(:valid_attributes) { {name: 'test set 1', description: 'a test description', file: file } }

      it "redirects to the root path" do
        post :create, {:carset => valid_attributes}
        expect(response).to redirect_to(root_url)
      end

    end
  end

  context 'with an admin user' do

    login_admin

    describe "GET new" do
      it "assigns a new carset as @carset" do
        get :new, {}
        expect(assigns(:carset)).to be_a_new(Carset)
      end
    end

    describe "POST create" do
      let(:file) {fixture_file_upload('data/carset.csv', 'text/csv')   }
      let(:valid_attributes) { {name: 'test set 1', description: 'a test description', file: file } }
      describe "with valid params" do
        it "creates a new Carset" do
          expect {
            post :create, {:carset => valid_attributes}
          }.to change(Carset, :count).by(1)
        end

        it "assigns a newly created carset as @carset" do
          post :create, {:carset => valid_attributes}
          expect(assigns(:carset)).to be_a(Carset)
          expect(assigns(:carset)).to be_persisted
        end

        it "redirects to root url with a flash notice" do
          post :create, {:carset => valid_attributes}
          expect(response).to redirect_to(root_url)
          expect(flash[:notice]).to be_present
        end
      end
    end
  end

end
