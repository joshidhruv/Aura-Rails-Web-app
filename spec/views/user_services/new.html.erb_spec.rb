require 'spec_helper'

describe "user_services/new" do
  before(:each) do
    assign(:user_service, stub_model(UserService).as_new_record)
  end

  it "renders new user_service form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_services_path, "post" do
    end
  end
end
