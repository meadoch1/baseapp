require 'rails_helper'

RSpec.describe "carsets/new", :type => :view do
  before(:each) do
    assign(:carset, Carset.new(
      :name => "MyString",
      :description => "MyText",
      :user => nil
    ))
  end

  it "renders new carset form" do
    render

    assert_select "form[action=?][method=?]", carsets_path, "post" do

      assert_select "input#carset_name[name=?]", "carset[name]"

      assert_select "textarea#carset_description[name=?]", "carset[description]"

      assert_select "input#carset_user_id[name=?]", "carset[user_id]"
    end
  end
end
