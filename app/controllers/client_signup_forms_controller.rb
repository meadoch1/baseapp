class ClientSignupFormsController < ApplicationController
  respond_to :html

  def new
    @signup = ClientSignupForm.new
    @facilities = Facility.all
    @address_types = AddressType.all
    respond_with(@signup)
  end

  def create
    @signup = ClientSignupForm.new(client_params)
    if @signup.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private
  def client_params
    result = params.require(:client_signup_form).permit(:last_name, :first_name, :middle_name,
                                              :facility_id, :facility_identifier, :phone,
                                              :mobile_phone, :address_type_id, :line1, :line2, :city,
                                              :state, :zip, :release_date, :contact_date)
    result["release_date"] = Date.strptime(result["release_date"], "%m/%d/%Y") if result["release_date"]
    result
  end
end
