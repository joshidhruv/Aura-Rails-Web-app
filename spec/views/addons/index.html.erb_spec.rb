require 'spec_helper'

describe "addons/index" do
  before(:each) do
    assign(:addons, [
      stub_model(Addon),
      stub_model(Addon)
    ])
  end

  it "renders a list of addons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
