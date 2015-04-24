class ClientSearchController < ApplicationController
  respond_to :html, :json #, :csv

  load_and_authorize_resource

  def index
    @client = Client.new
    #@years = CarPoint.uniq.pluck(:year).sort
  end

  def find
    @result = ClientSearch.find(params[:year], params[:make], params[:model])
    #respond_to do |format|
      #format.json {render json: {results: @result.clients}}
      #format.csv { send_data ActiveRecordCsv.to_csv(@result.clients), filename: "clientsearch.csv" }
    #end
    #respond_with(result)
  end
end
