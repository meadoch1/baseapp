require 'rails_helper'

RSpec.describe "carsets/index", :type => :view do
  before(:each) do
    assign(:carsets, [
      Carset.create!(
        :name => "Name",
        :description => "MyText",
        :user => nil
      ),
      Carset.create!(
        :name => "Name",
        :description => "MyText",
        :user => nil
      )
    ])
  end

  it "renders a list of carsets" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
