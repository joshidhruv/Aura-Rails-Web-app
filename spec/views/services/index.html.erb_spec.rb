require 'spec_helper'

describe "services/index" do
  before(:each) do
    assign(:services, [
      stub_model(Service,
        :name => "Name",
        :description => "MyText",
        :price => "9.99",
        :minutes_duration => 1,
        :company_id => 2,
        :all_staff => false
      ),
      stub_model(Service,
        :name => "Name",
        :description => "MyText",
        :price => "9.99",
        :minutes_duration => 1,
        :company_id => 2,
        :all_staff => false
      )
    ])
  end

  it "renders a list of services" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
