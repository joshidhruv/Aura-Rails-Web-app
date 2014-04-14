require 'spec_helper'

describe "service_locations/new" do
  before(:each) do
    assign(:service_location, stub_model(ServiceLocation,
      :service_id => 1,
      :location_id => 1
    ).as_new_record)
  end

  it "renders new service_location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", service_locations_path, "post" do
      assert_select "input#service_location_service_id[name=?]", "service_location[service_id]"
      assert_select "input#service_location_location_id[name=?]", "service_location[location_id]"
    end
  end
end
