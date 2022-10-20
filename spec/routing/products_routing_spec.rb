require "rails_helper"

RSpec.describe ProductsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/brands/1/products").to route_to(:controller => "products",
        :brand_id => "1", :action => "index")
    end

    it "routes to #show" do
      expect(get: "/brands/1/products/1").to route_to(:controller => "brands", 
        :brand_id => "1", :controller => "products", :action => "show", :id => "1")
    end


    it "routes to #create" do
      expect(post: "/brands/1/products").to route_to(:controller => "brands", 
        :brand_id => "1", :controller => "products", :action => "create")
    end

    it "routes to #update via PUT" do
      expect(put: "/brands/1/products/1").to route_to(:controller => "brands", 
        :brand_id => "1", :controller => "products", :action => "update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/brands/1/products/1").to route_to(:controller => "brands", 
        :brand_id => "1", :controller => "products", :action => "update", :id => "1")
    end

    it "routes to #destroy" do
      expect(delete: "/brands/1/products/1").to route_to(:controller => "brands", 
        :brand_id => "1", :controller => "products", :action => "destroy", :id => "1")
    end
  end
end
