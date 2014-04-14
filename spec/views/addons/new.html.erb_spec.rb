require 'spec_helper'

describe "addons/new" do
  before(:each) do
    assign(:addon, stub_model(Addon,
      :name => "MyString",
      :price => "9.99",
      :description => "MyText",
      :company_id => "MyString"
    ).as_new_record)
  end

  it "renders new addon form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", addons_path, "post" do
      assert_select "input#addon_name[name=?]", "addon[name]"
      assert_select "input#addon_price[name=?]", "addon[price]"
      assert_select "textarea#addon_description[name=?]", "addon[description]"
      assert_select "input#addon_company_id[name=?]", "addon[company_id]"
    end
  end
end
