class Project < ActiveRecord::Base
  belongs_to :customer

  def company
    customer.company
  end
end
