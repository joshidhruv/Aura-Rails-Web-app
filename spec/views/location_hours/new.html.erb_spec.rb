require 'spec_helper'

describe "location_hours/new" do
  before(:each) do
    assign(:location_hour, stub_model(LocationHour,
      :location_id => 1
    ).as_new_record)
  end

  it "renders new location_hour form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", location_hours_path, "post" do
      assert_select "input#location_hour_location_id[name=?]", "location_hour[location_id]"
    end
  end
end
