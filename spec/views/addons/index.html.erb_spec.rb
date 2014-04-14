require 'spec_helper'

describe "addons/index" do
  before(:each) do
    assign(:addons, [
      stub_model(Addon,
        :name => "Name",
        :price => "9.99",
        :description => "MyText",
        :company_id => "Company"
      ),
      stub_model(Addon,
        :name => "Name",
        :price => "9.99",
        :description => "MyText",
        :company_id => "Company"
      )
    ])
  end

  it "renders a list of addons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Company".to_s, :count => 2
  end
end
