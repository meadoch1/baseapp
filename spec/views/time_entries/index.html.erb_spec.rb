require 'rails_helper'

RSpec.describe "time_entries/index", :type => :view do
  before(:each) do
    assign(:time_entries, [
      TimeEntry.create!(),
      TimeEntry.create!()
    ])
  end

  it "renders a list of time_entries" do
    render
  end
end
