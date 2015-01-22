class CarPointsController < ApplicationController
  before_action :set_car_point, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @car_points = CarPoint.all
    respond_with(@car_points)
  end

  def show
    respond_with(@car_point)
  end

  def new
    @car_point = CarPoint.new
    respond_with(@car_point)
  end

  def edit
  end

  def create
    @car_point = CarPoint.new(car_point_params)
    @car_point.save
    respond_with(@car_point)
  end

  def update
    @car_point.update(car_point_params)
    respond_with(@car_point)
  end

  def destroy
    @car_point.destroy
    respond_with(@car_point)
  end

  private
    def set_car_point
      @car_point = CarPoint.find(params[:id])
    end

    def car_point_params
      params.require(:car_point).permit(:year, :make, :model)
    end
end
