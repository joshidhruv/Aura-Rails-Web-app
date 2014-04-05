require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :f_name => "F Name",
      :l_name => "L Name",
      :business_name => "Business Name",
      :email => "Email",
      :password => "Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/F Name/)
    rendered.should match(/L Name/)
    rendered.should match(/Business Name/)
    rendered.should match(/Email/)
    rendered.should match(/Password/)
  end
end
