require 'spec_helper'

describe "location_hours/index" do
  before(:each) do
    assign(:location_hours, [
      stub_model(LocationHour),
      stub_model(LocationHour)
    ])
  end

  it "renders a list of location_hours" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
