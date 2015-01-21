class CarSearchController < ApplicationController
  respond_to :html, :json, :csv

  def index
    @carpoint = CarPoint.new
    @years = CarPoint.uniq.pluck(:year).sort
  end

  def find
    result = CarSearch.find(params[:year], params[:make], params[:model])
    respond_with(result)
  end
end