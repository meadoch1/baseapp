require 'rails_helper'

RSpec.describe "carsets/edit", :type => :view do
  before(:each) do
    @carset = assign(:carset, Carset.create!(
      :name => "MyString",
      :description => "MyText",
      :user => nil
    ))
  end

  it "renders the edit carset form" do
    render

    assert_select "form[action=?][method=?]", carset_path(@carset), "post" do

      assert_select "input#carset_name[name=?]", "carset[name]"

      assert_select "textarea#carset_description[name=?]", "carset[description]"

      assert_select "input#carset_user_id[name=?]", "carset[user_id]"
    end
  end
end
