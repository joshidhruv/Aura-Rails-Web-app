require 'spec_helper'

describe "location_hours/show" do
  before(:each) do
    @location_hour = assign(:location_hour, stub_model(LocationHour,
      :location_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
