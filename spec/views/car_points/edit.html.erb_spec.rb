require 'rails_helper'

RSpec.describe "car_points/edit", :type => :view do
  before(:each) do
    @car_point = assign(:car_point, CarPoint.create!(
      :year => "MyString",
      :make => "MyString",
      :model => "MyString"
    ))
  end

  it "renders the edit car_point form" do
    render

    assert_select "form[action=?][method=?]", car_point_path(@car_point), "post" do

      assert_select "input#car_point_year[name=?]", "car_point[year]"

      assert_select "input#car_point_make[name=?]", "car_point[make]"

      assert_select "input#car_point_model[name=?]", "car_point[model]"
    end
  end
end
