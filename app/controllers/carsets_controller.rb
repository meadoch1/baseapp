class CarsetsController < ApplicationController
  before_action :set_carset, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @carsets = Carset.all
    respond_with(@carsets)
  end

  def show
    respond_with(@carset)
  end

  def new
    @carset = Carset.new
    respond_with(@carset)
  end

  def edit
  end

  def create
    @carset = Carset.new(carset_params)
    @carset.save
    respond_with(@carset)
  end

  def update
    @carset.update(carset_params)
    respond_with(@carset)
  end

  def destroy
    @carset.destroy
    respond_with(@carset)
  end

  private
    def set_carset
      @carset = Carset.find(params[:id])
    end

    def carset_params
      params.require(:carset).permit(:name, :description, :user_id, :file)
    end
end
