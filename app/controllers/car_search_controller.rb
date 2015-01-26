class CarSearchController < ApplicationController
  respond_to :html, :json, :csv

  load_and_authorize_resource

  def index
    @carpoint = CarPoint.new
    @years = CarPoint.uniq.pluck(:year).sort
  end

  def find
    @result = CarSearch.find(params[:year], params[:make], params[:model])
    respond_to do |format|
      format.json {render json: {results: @result.points}}
      format.csv { send_data ActiveRecordCsv.to_csv(@result.points), filename: "carsearch.csv" }
    end
    #respond_with(result)
  end
end
