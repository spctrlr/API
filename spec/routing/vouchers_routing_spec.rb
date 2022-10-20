require "rails_helper"

RSpec.describe VouchersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/users/1/vouchers").to route_to(:controller => "vouchers",
        :user_id => "1", :action => "index")
    end

    it "routes to #show" do
      expect(get: "/users/1/vouchers/1").to route_to(:controller => "users", 
        :user_id => "1", :controller => "vouchers", :action => "show", :id => "1")
    end

    it "routes to #create" do
      expect(post: "/users/1/vouchers").to route_to(:controller => "vouchers",
        :user_id => "1", :action => "create")
    end

    it "routes to #update via PUT" do
      expect(put: "/users/1/vouchers/1").to route_to(:controller => "users", 
        :user_id => "1", :controller => "vouchers", :action => "update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/users/1/vouchers/1").to route_to(:controller => "users", 
        :user_id => "1", :controller => "vouchers", :action => "update", :id => "1")
    end

    it "routes to #destroy" do
      expect(delete: "/users/1/vouchers/1").to route_to(:controller => "users", 
        :user_id => "1", :controller => "vouchers", :action => "destroy", :id => "1")
    end
  end
end
