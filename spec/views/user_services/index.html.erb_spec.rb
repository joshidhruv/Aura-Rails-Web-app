require 'spec_helper'

describe "user_services/index" do
  before(:each) do
    assign(:user_services, [
      stub_model(UserService,
        :user_id => 1,
        :service_id => 2,
        :price => "9.99"
      ),
      stub_model(UserService,
        :user_id => 1,
        :service_id => 2,
        :price => "9.99"
      )
    ])
  end

  it "renders a list of user_services" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
