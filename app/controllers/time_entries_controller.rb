class TimeEntriesController < ApplicationController
  before_action :set_time_entry, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @focus_date = if params["performed_at"]
                    Date.strptime(params["performed_at"])
                  else
                    Date.today
                  end

    relation = if current_user.admin?
                      TimeEntry
                    else
                      current_user.time_entries
                    end
    @time_entries = relation.where(performed_dt: @focus_date).all
    respond_with(@time_entries)
  end

  def show
    respond_with(@time_entry)
  end

  def new
    @time_entry = TimeEntry.new
    respond_with(@time_entry)
  end

  def edit
  end

  def create
    @time_entry = TimeEntry.new(time_entry_params)
    @time_entry.save
    respond_with(@time_entry)
  end

  def update
    @time_entry.update(time_entry_params)
    respond_with(@time_entry)
  end

  def destroy
    @time_entry.destroy
    respond_with(@time_entry)
  end

  private
    def set_time_entry
      @time_entry = TimeEntry.find(params[:id])
    end

    def time_entry_params
      params[:time_entry]
    end
end
