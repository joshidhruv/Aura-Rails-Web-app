require 'spec_helper'

describe "user_services/edit" do
  before(:each) do
    @user_service = assign(:user_service, stub_model(UserService))
  end

  it "renders the edit user_service form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_service_path(@user_service), "post" do
    end
  end
end
