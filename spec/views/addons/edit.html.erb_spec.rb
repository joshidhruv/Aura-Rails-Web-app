require 'spec_helper'

describe "addons/edit" do
  before(:each) do
    @addon = assign(:addon, stub_model(Addon,
      :name => "MyString",
      :price => "9.99",
      :description => "MyText",
      :company_id => "MyString"
    ))
  end

  it "renders the edit addon form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", addon_path(@addon), "post" do
      assert_select "input#addon_name[name=?]", "addon[name]"
      assert_select "input#addon_price[name=?]", "addon[price]"
      assert_select "textarea#addon_description[name=?]", "addon[description]"
      assert_select "input#addon_company_id[name=?]", "addon[company_id]"
    end
  end
end
