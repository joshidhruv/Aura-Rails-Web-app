require 'spec_helper'

describe "addons/edit" do
  before(:each) do
    @addon = assign(:addon, stub_model(Addon))
  end

  it "renders the edit addon form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", addon_path(@addon), "post" do
    end
  end
end
