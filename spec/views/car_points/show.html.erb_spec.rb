require 'rails_helper'

RSpec.describe "car_points/show", :type => :view do
  before(:each) do
    @car_point = assign(:car_point, create(:car_point, year: 2000))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2000/)
    expect(rendered).to match(/Ford/)
    expect(rendered).to match(/Mustang/)
  end
end
