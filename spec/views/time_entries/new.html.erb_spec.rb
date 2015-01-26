require 'rails_helper'

RSpec.describe "time_entries/new", :type => :view do
  before(:each) do
    assign(:time_entry, TimeEntry.new())
  end

  it "renders new time_entry form" do
    render

    assert_select "form[action=?][method=?]", time_entries_path, "post" do
    end
  end
end
