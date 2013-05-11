require "spec_helper"

describe DesignVersionsController do
  describe "routing" do

    it "routes to #index" do
      get("/design_versions").should route_to("design_versions#index")
    end

    it "routes to #new" do
      get("/design_versions/new").should route_to("design_versions#new")
    end

    it "routes to #show" do
      get("/design_versions/1").should route_to("design_versions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/design_versions/1/edit").should route_to("design_versions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/design_versions").should route_to("design_versions#create")
    end

    it "routes to #update" do
      put("/design_versions/1").should route_to("design_versions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/design_versions/1").should route_to("design_versions#destroy", :id => "1")
    end

  end
end
