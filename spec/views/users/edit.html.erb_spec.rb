require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :f_name => "MyString",
      :l_name => "MyString",
      :business_name => "MyString",
      :email => "MyString",
      :password => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_path(@user), "post" do
      assert_select "input#user_f_name[name=?]", "user[f_name]"
      assert_select "input#user_l_name[name=?]", "user[l_name]"
      assert_select "input#user_business_name[name=?]", "user[business_name]"
      assert_select "input#user_email[name=?]", "user[email]"
      assert_select "input#user_password[name=?]", "user[password]"
    end
  end
end
