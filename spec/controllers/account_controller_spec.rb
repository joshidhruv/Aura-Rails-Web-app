require 'spec_helper'

describe AccountController do

  describe "GET 'MyAccount'" do
    it "returns http success" do
      get 'MyAccount'
      response.should be_success
    end
  end

end
