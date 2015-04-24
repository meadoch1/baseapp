class ClientSignupForm
  include Virtus

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_reader :client, :street_address, :person

  attribute :facility_identifier, String
  attribute :release_date, Date

  attribute :facility_id, Integer
  attribute :first_name, String
  attribute :last_name, String
  attribute :middle_name, String
  attribute :phone, String
  attribute :mobile_phone, String

  attribute :address_type_id, Integer
  attribute :line1, String
  attribute :line2, String
  attribute :city, String
  attribute :state, String
  attribute :zip, String

  validates :facility_identifier, presence: true
  validate :release_date_in_future

  validates :facility_id, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :middle_name, presence: true
  attribute :contact_date, Date
  validates :phone, presence: true
  validates :mobile_phone, presence: true

  validates :address_type_id, presence: true
  validates :line1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true

  def persisted?
    false
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  private

  def persist!
    @street_address = StreetAddress.create! address_type_id: address_type_id,
      line1: line1, line2: line2, city: city, zip_code: zip
    @person = Person.create! first_name: first_name,
      last_name: last_name, middle_name: middle_name, phone: phone, mobile_phone: mobile_phone, street_address: @street_address
    @client = Client.create! facility_id: facility_id, facility_identifier: facility_identifier, release_date: release_date,
      person: @person, contact_date: contact_date
  end

  def release_date_in_future
    errors.add(:release_date, "Release date must be in the future") if release_date && release_date < Date.today
  end

end
