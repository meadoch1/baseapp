class CarsetsController < ApplicationController

  load_and_authorize_resource

  respond_to :html

  def new
    @carset = Carset.new
    respond_with(@carset)
  end

  def create
    @carset = Carset.new(carset_params)
    @carset.save
    redirect_to root_url, notice: "Carset added"
  end

  private
    def carset_params
      params.require(:carset).permit(:name, :description, :user_id, :file)
    end
end
