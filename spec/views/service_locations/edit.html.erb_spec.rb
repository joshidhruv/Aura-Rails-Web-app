require 'spec_helper'

describe "service_locations/edit" do
  before(:each) do
    @service_location = assign(:service_location, stub_model(ServiceLocation,
      :service_id => 1,
      :location_id => 1
    ))
  end

  it "renders the edit service_location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", service_location_path(@service_location), "post" do
      assert_select "input#service_location_service_id[name=?]", "service_location[service_id]"
      assert_select "input#service_location_location_id[name=?]", "service_location[location_id]"
    end
  end
end
