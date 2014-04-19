require 'spec_helper'

describe "addons/show" do
  before(:each) do
    @addon = assign(:addon, stub_model(Addon))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
