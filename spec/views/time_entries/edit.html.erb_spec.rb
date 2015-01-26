require 'rails_helper'

RSpec.describe "time_entries/edit", :type => :view do
  before(:each) do
    @time_entry = assign(:time_entry, TimeEntry.create!())
  end

  it "renders the edit time_entry form" do
    render

    assert_select "form[action=?][method=?]", time_entry_path(@time_entry), "post" do
    end
  end
end
