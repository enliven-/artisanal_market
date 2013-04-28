require "spec_helper"

describe AttributeLayersController do
  describe "routing" do

    it "routes to #index" do
      get("/attribute_layers").should route_to("attribute_layers#index")
    end

    it "routes to #new" do
      get("/attribute_layers/new").should route_to("attribute_layers#new")
    end

    it "routes to #show" do
      get("/attribute_layers/1").should route_to("attribute_layers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/attribute_layers/1/edit").should route_to("attribute_layers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/attribute_layers").should route_to("attribute_layers#create")
    end

    it "routes to #update" do
      put("/attribute_layers/1").should route_to("attribute_layers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/attribute_layers/1").should route_to("attribute_layers#destroy", :id => "1")
    end

  end
end
