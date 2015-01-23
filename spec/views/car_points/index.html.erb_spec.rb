require 'rails_helper'

RSpec.describe "car_points/index", :type => :view do
    login_user
  before(:each) do
    assign(:car_points, [
      create(:car_point, year: 2000),
      create(:car_point, year: 2000)
    ])
  end

  it "renders a list of car_points" do
    render
    assert_select "tr>td", :text => "2000".to_s, :count => 2
    assert_select "tr>td", :text => "Ford".to_s, :count => 2
    assert_select "tr>td", :text => "Mustang".to_s, :count => 2
  end
end
