require 'spec_helper'

describe "user_services/index" do
  before(:each) do
    assign(:user_services, [
      stub_model(UserService),
      stub_model(UserService)
    ])
  end

  it "renders a list of user_services" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
