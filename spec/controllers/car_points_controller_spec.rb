require 'rails_helper'

RSpec.describe CarPointsController, :type => :controller do


  let(:valid_attributes) {
    {year: '1990', make: 'Ford', model: 'Mustang'}
  }

  let(:invalid_attributes) {
    { year: 'Two thousand', make: '', model: '' }
  }

  context 'as a non-admin user' do

    login_user

    describe "GET index" do
      it "assigns all car_points as @car_points" do
        car_point = CarPoint.create! valid_attributes
        get :index, {}
        expect(assigns(:car_points)).to eq([car_point])
      end
    end

    describe "GET show" do
      it "assigns the requested car_point as @car_point" do
        car_point = CarPoint.create! valid_attributes
        get :show, {:id => car_point.to_param}
        expect(assigns(:car_point)).to eq(car_point)
      end
    end

    describe "GET new" do
      it "redirects to root" do
        get :new, {}
        expect(response).to redirect_to(root_url)
      end
    end

    describe "GET edit" do
      it "redirects to root" do
        car_point = CarPoint.create! valid_attributes
        get :edit, {:id => car_point.to_param}
        expect(response).to redirect_to(root_url)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "redirects to root" do
          post :create, {:car_point => valid_attributes}
          expect(response).to redirect_to(root_url)
        end
      end

      describe "with invalid params" do
        it "redirects to root" do
          post :create, {:car_point => invalid_attributes}
          expect(response).to redirect_to(root_url)
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        let(:new_attributes) {
          valid_attributes
        }

        it "redirects to root" do
          car_point = CarPoint.create! valid_attributes
          put :update, {:id => car_point.to_param, :car_point => new_attributes}
          expect(response).to redirect_to(root_url)
        end
      end

      describe "with invalid params" do
        it "redirects to root" do
          car_point = CarPoint.create! valid_attributes
          put :update, {:id => car_point.to_param, :car_point => invalid_attributes}
          expect(response).to redirect_to(root_url)
        end
      end
    end

    describe "DELETE destroy" do
      it "redirects to root" do
        car_point = CarPoint.create! valid_attributes
        delete :destroy, {:id => car_point.to_param}
        expect(response).to redirect_to(root_url)
      end
    end
  end

  context 'as an admin user' do

    login_admin

    describe "GET index" do
      it "assigns all car_points as @car_points" do
        car_point = CarPoint.create! valid_attributes
        get :index, {}
        expect(assigns(:car_points)).to eq([car_point])
      end
    end

    describe "GET show" do
      it "assigns the requested car_point as @car_point" do
        car_point = CarPoint.create! valid_attributes
        get :show, {:id => car_point.to_param}
        expect(assigns(:car_point)).to eq(car_point)
      end
    end

    describe "GET new" do
      it "assigns a new car_point as @car_point" do
        get :new, {}
        expect(assigns(:car_point)).to be_a_new(CarPoint)
      end
    end

    describe "GET edit" do
      it "assigns the requested car_point as @car_point" do
        car_point = CarPoint.create! valid_attributes
        get :edit, {:id => car_point.to_param}
        expect(assigns(:car_point)).to eq(car_point)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new CarPoint" do
          expect {
            post :create, {:car_point => valid_attributes}
          }.to change(CarPoint, :count).by(1)
        end

        it "assigns a newly created car_point as @car_point" do
          post :create, {:car_point => valid_attributes}
          expect(assigns(:car_point)).to be_a(CarPoint)
          expect(assigns(:car_point)).to be_persisted
        end

        it "redirects to the created car_point" do
          post :create, {:car_point => valid_attributes}
          expect(response).to redirect_to(CarPoint.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved car_point as @car_point" do
          post :create, {:car_point => invalid_attributes}
          expect(assigns(:car_point)).to be_a_new(CarPoint)
        end

        it "re-renders the 'new' template" do
          post :create, {:car_point => invalid_attributes}
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        let(:new_attributes) {
          { year: '2000' }
        }

        it "updates the requested car_point" do
          car_point = create :car_point
          put :update, {:id => car_point.to_param, :car_point => new_attributes}
          car_point.reload
          expect(car_point.year).to eq('2000')
        end

        it "assigns the requested car_point as @car_point" do
          car_point = CarPoint.create! valid_attributes
          put :update, {:id => car_point.to_param, :car_point => valid_attributes}
          expect(assigns(:car_point)).to eq(car_point)
        end

        it "redirects to the car_point" do
          car_point = CarPoint.create! valid_attributes
          put :update, {:id => car_point.to_param, :car_point => valid_attributes}
          expect(response).to redirect_to(car_point)
        end
      end

      describe "with invalid params" do
        it "assigns the car_point as @car_point" do
          car_point = CarPoint.create! valid_attributes
          put :update, {:id => car_point.to_param, :car_point => invalid_attributes}
          expect(assigns(:car_point)).to eq(car_point)
        end

        it "re-renders the 'edit' template" do
          car_point = CarPoint.create! valid_attributes
          put :update, {:id => car_point.to_param, :car_point => invalid_attributes}
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested car_point" do
        car_point = CarPoint.create! valid_attributes
        expect {
          delete :destroy, {:id => car_point.to_param}
        }.to change(CarPoint, :count).by(-1)
      end

      it "redirects to the car_points list" do
        car_point = CarPoint.create! valid_attributes
        delete :destroy, {:id => car_point.to_param}
        expect(response).to redirect_to(car_points_url)
      end
    end
  end

end
