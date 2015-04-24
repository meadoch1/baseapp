class Client < ActiveRecord::Base
  belongs_to :person
  belongs_to :facility

  def first_name
    person.first_name
  end

  def last_name
    person.last_name
  end

  def city
    person.street_address.city
  end

  def state
    person.street_address.state
  end

  def facility_name
    facility.name
  end

end
