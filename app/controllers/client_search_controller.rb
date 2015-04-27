class ClientSearchController < ApplicationController
  respond_to :html, :json #, :csv

  load_and_authorize_resource

  def index
    @client = Client.new
    @facilities = Facility.order(:name)
  end

  def find
    @result = ClientSearch.find(
      params[:first_name],
      params[:last_name],
      params[:city],
      params[:state],
      params[:facility_id]
    )
  end
end
