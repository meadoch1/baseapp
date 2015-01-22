require 'rails_helper'

RSpec.describe "car_points/index", :type => :view do
  before(:each) do
    assign(:car_points, [
      CarPoint.create!(
        :year => "Year",
        :make => "Make",
        :model => "Model"
      ),
      CarPoint.create!(
        :year => "Year",
        :make => "Make",
        :model => "Model"
      )
    ])
  end

  it "renders a list of car_points" do
    render
    assert_select "tr>td", :text => "Year".to_s, :count => 2
    assert_select "tr>td", :text => "Make".to_s, :count => 2
    assert_select "tr>td", :text => "Model".to_s, :count => 2
  end
end
