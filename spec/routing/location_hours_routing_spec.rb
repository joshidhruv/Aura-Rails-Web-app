require "spec_helper"

describe LocationHoursController do
  describe "routing" do

    it "routes to #index" do
      get("/location_hours").should route_to("location_hours#index")
    end

    it "routes to #new" do
      get("/location_hours/new").should route_to("location_hours#new")
    end

    it "routes to #show" do
      get("/location_hours/1").should route_to("location_hours#show", :id => "1")
    end

    it "routes to #edit" do
      get("/location_hours/1/edit").should route_to("location_hours#edit", :id => "1")
    end

    it "routes to #create" do
      post("/location_hours").should route_to("location_hours#create")
    end

    it "routes to #update" do
      put("/location_hours/1").should route_to("location_hours#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/location_hours/1").should route_to("location_hours#destroy", :id => "1")
    end

  end
end
