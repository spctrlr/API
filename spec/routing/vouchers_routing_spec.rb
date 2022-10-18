require "rails_helper"

RSpec.describe VouchersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/vouchers").to route_to("vouchers#index")
    end

    it "routes to #show" do
      expect(get: "/vouchers/1").to route_to("vouchers#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/vouchers").to route_to("vouchers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/vouchers/1").to route_to("vouchers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/vouchers/1").to route_to("vouchers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/vouchers/1").to route_to("vouchers#destroy", id: "1")
    end
  end
end
