require 'spec_helper'

describe "addons/show" do
  before(:each) do
    @addon = assign(:addon, stub_model(Addon,
      :name => "Name",
      :price => "9.99",
      :description => "MyText",
      :company_id => "Company"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/9.99/)
    rendered.should match(/MyText/)
    rendered.should match(/Company/)
  end
end
