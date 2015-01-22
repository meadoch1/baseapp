require 'rails_helper'

RSpec.describe "car_points/new", :type => :view do
  before(:each) do
    assign(:car_point, CarPoint.new(
      :year => "MyString",
      :make => "MyString",
      :model => "MyString"
    ))
  end

  it "renders new car_point form" do
    render

    assert_select "form[action=?][method=?]", car_points_path, "post" do

      assert_select "input#car_point_year[name=?]", "car_point[year]"

      assert_select "input#car_point_make[name=?]", "car_point[make]"

      assert_select "input#car_point_model[name=?]", "car_point[model]"
    end
  end
end
