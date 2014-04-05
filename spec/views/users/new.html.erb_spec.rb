require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :f_name => "MyString",
      :l_name => "MyString",
      :business_name => "MyString",
      :email => "MyString",
      :password => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_f_name[name=?]", "user[f_name]"
      assert_select "input#user_l_name[name=?]", "user[l_name]"
      assert_select "input#user_business_name[name=?]", "user[business_name]"
      assert_select "input#user_email[name=?]", "user[email]"
      assert_select "input#user_password[name=?]", "user[password]"
    end
  end
end
