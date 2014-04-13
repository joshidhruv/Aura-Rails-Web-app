require 'spec_helper'

describe "appointments/edit" do
  before(:each) do
    @appointment = assign(:appointment, stub_model(Appointment,
      :guest_id => 1,
      :host_id => 1,
      :location_id => 1,
      :service_id => 1,
      :cost => "9.99",
      :notification_on => false,
      :notification_sent => false,
      :accepted => false,
      :completed => false
    ))
  end

  it "renders the edit appointment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", appointment_path(@appointment), "post" do
      assert_select "input#appointment_guest_id[name=?]", "appointment[guest_id]"
      assert_select "input#appointment_host_id[name=?]", "appointment[host_id]"
      assert_select "input#appointment_location_id[name=?]", "appointment[location_id]"
      assert_select "input#appointment_service_id[name=?]", "appointment[service_id]"
      assert_select "input#appointment_cost[name=?]", "appointment[cost]"
      assert_select "input#appointment_notification_on[name=?]", "appointment[notification_on]"
      assert_select "input#appointment_notification_sent[name=?]", "appointment[notification_sent]"
      assert_select "input#appointment_accepted[name=?]", "appointment[accepted]"
      assert_select "input#appointment_completed[name=?]", "appointment[completed]"
    end
  end
end
