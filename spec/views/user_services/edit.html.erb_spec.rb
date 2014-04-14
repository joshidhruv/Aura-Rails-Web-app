require 'spec_helper'

describe "user_services/edit" do
  before(:each) do
    @user_service = assign(:user_service, stub_model(UserService,
      :user_id => 1,
      :service_id => 1,
      :price => "9.99"
    ))
  end

  it "renders the edit user_service form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_service_path(@user_service), "post" do
      assert_select "input#user_service_user_id[name=?]", "user_service[user_id]"
      assert_select "input#user_service_service_id[name=?]", "user_service[service_id]"
      assert_select "input#user_service_price[name=?]", "user_service[price]"
    end
  end
end
