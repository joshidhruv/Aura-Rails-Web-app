require "spec_helper"

describe UserServicesController do
  describe "routing" do

    it "routes to #index" do
      get("/user_services").should route_to("user_services#index")
    end

    it "routes to #new" do
      get("/user_services/new").should route_to("user_services#new")
    end

    it "routes to #show" do
      get("/user_services/1").should route_to("user_services#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_services/1/edit").should route_to("user_services#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_services").should route_to("user_services#create")
    end

    it "routes to #update" do
      put("/user_services/1").should route_to("user_services#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_services/1").should route_to("user_services#destroy", :id => "1")
    end

  end
end
