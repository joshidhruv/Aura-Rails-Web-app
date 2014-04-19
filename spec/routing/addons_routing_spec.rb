require "spec_helper"

describe AddonsController do
  describe "routing" do

    it "routes to #index" do
      get("/addons").should route_to("addons#index")
    end

    it "routes to #new" do
      get("/addons/new").should route_to("addons#new")
    end

    it "routes to #show" do
      get("/addons/1").should route_to("addons#show", :id => "1")
    end

    it "routes to #edit" do
      get("/addons/1/edit").should route_to("addons#edit", :id => "1")
    end

    it "routes to #create" do
      post("/addons").should route_to("addons#create")
    end

    it "routes to #update" do
      put("/addons/1").should route_to("addons#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/addons/1").should route_to("addons#destroy", :id => "1")
    end

  end
end
