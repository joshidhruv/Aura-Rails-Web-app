require 'spec_helper'

describe "location_hours/edit" do
  before(:each) do
    @location_hour = assign(:location_hour, stub_model(LocationHour))
  end

  it "renders the edit location_hour form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", location_hour_path(@location_hour), "post" do
    end
  end
end
