require 'rails_helper'

# ActiveRecord::InvalidForeignKey: PG::ForeignKeyViolation: ERROR:
RSpec.describe "/orders", type: :request do

  let(:valid_attributes) do {
      final_amount: 250,
      currency: "USD",
      quantity: 1,
      status: true,
      voucher_id: 1,
      product_id: 1
    }
  end

  let(:invalid_attributes) do {
      final_amount: 250,
      currency: "USD",
      quantity: nil,
      status: true,
      voucher_id: 1,
      product_id: 1
    }
  end

  let(:valid_headers) { {authorize: 'authorization-token'} }

  describe "GET /index" do
    it "renders a successful response" do
      Order.create! valid_attributes
      get orders_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      order = Order.create! valid_attributes
      get order_url(order), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Order" do
        expect {
          post orders_url,
               params: { order: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Order, :count).by(1)
      end

      it "renders a JSON response with the new order" do
        post orders_url,
             params: { order: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Order" do
        expect {
          post orders_url,
               params: { order: invalid_attributes }, as: :json
        }.to change(Order, :count).by(0)
      end

      it "renders a JSON response with errors for the new order" do
        post orders_url,
             params: { order: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested order" do
        order = Order.create! valid_attributes
        patch order_url(order),
              params: { order: new_attributes }, headers: valid_headers, as: :json
        order.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the order" do
        order = Order.create! valid_attributes
        patch order_url(order),
              params: { order: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the order" do
        order = Order.create! valid_attributes
        patch order_url(order),
              params: { order: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested order" do
      order = Order.create! valid_attributes
      expect {
        delete order_url(order), headers: valid_headers, as: :json
      }.to change(Order, :count).by(-1)
    end
  end
end
