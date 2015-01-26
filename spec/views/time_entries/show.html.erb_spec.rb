require 'rails_helper'

RSpec.describe "time_entries/show", :type => :view do
  before(:each) do
    @time_entry = assign(:time_entry, TimeEntry.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
