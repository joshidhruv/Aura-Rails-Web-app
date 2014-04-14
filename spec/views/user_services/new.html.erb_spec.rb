require 'spec_helper'

describe "user_services/new" do
  before(:each) do
    assign(:user_service, stub_model(UserService,
      :user_id => 1,
      :service_id => 1,
      :price => "9.99"
    ).as_new_record)
  end

  it "renders new user_service form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_services_path, "post" do
      assert_select "input#user_service_user_id[name=?]", "user_service[user_id]"
      assert_select "input#user_service_service_id[name=?]", "user_service[service_id]"
      assert_select "input#user_service_price[name=?]", "user_service[price]"
    end
  end
end
