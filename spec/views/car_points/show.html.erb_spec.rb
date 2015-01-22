require 'rails_helper'

RSpec.describe "car_points/show", :type => :view do
  before(:each) do
    @car_point = assign(:car_point, CarPoint.create!(
      :year => "Year",
      :make => "Make",
      :model => "Model"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Year/)
    expect(rendered).to match(/Make/)
    expect(rendered).to match(/Model/)
  end
end
