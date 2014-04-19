require 'spec_helper'

describe "user_services/show" do
  before(:each) do
    @user_service = assign(:user_service, stub_model(UserService))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
