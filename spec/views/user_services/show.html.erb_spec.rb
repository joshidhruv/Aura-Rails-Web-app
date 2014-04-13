require 'spec_helper'

describe "user_services/show" do
  before(:each) do
    @user_service = assign(:user_service, stub_model(UserService,
      :user_id => 1,
      :service_id => 2,
      :price => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/9.99/)
  end
end
