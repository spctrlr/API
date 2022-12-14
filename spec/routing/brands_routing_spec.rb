require "rails_helper"

RSpec.describe BrandsController, type: :routing do
  describe "routing" do

    it "routes to #show" do
      expect(get: "/brands/1").to route_to("brands#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/brands").to route_to("brands#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/brands/1").to route_to("brands#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/brands/1").to route_to("brands#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/brands/1").to route_to("brands#destroy", id: "1")
    end
  end
end
