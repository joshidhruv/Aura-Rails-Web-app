require 'spec_helper'

describe "appointments/index" do
  before(:each) do
    assign(:appointments, [
      stub_model(Appointment,
        :guest_id => 1,
        :host_id => 2,
        :location_id => 3,
        :service_id => 4,
        :cost => "9.99",
        :notification_on => false,
        :notification_sent => false,
        :accepted => false,
        :completed => false
      ),
      stub_model(Appointment,
        :guest_id => 1,
        :host_id => 2,
        :location_id => 3,
        :service_id => 4,
        :cost => "9.99",
        :notification_on => false,
        :notification_sent => false,
        :accepted => false,
        :completed => false
      )
    ])
  end

  it "renders a list of appointments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
