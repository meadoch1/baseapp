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
    set_defaults(@time_entry)
    @projects = project_lookup
    render layout: false
  end

  def edit
    @projects = project_lookup
    render layout: false
  end

  def create
    data = time_entry_params
    do_start = data.delete("set_start")
    @time_entry = TimeEntry.new(data)
    set_defaults(@time_entry)
    @time_entry.save
    @time_entry.do_start(do_start)
    render nothing: true
  end

  def update
    data = time_entry_params
    do_start = data.delete("set_start")
    @time_entry.update(data) unless data.empty?
    @time_entry.do_start(do_start)
    render nothing: true
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
      allowed_params = params.require(:time_entry).permit(:description, :project_id, :task_id, :accrued_hrs, :set_start)
      allowed_params["accrued_hrs"] = allowed_params["accrued_hrs"].to_f if allowed_params["accrued_hrs"]
      allowed_params["set_start"] = allowed_params["set_start"] == "true" if allowed_params["set_start"]
      allowed_params
    end

    def project_lookup()
      Project.all.group_by(&:company)
      #vals = Project.all.map do |project|
        #OpenStruct.new(company: project.customer.company, label: project.name, value: project.id )
      #end
      #vals
    end

    def set_defaults(time_entry)
      time_entry.user ||= current_user
      time_entry.performed_dt ||= Date.today
    end

end
