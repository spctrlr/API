require 'rails_helper'

RSpec.describe "/brands", type: :request do

  let(:valid_attributes) do {
    name: "Toy Store",
    address: "Some Parking Lot",
    email: "toy_store@email.com",
    status: true
    }
  end

  let(:invalid_attributes) do {
    name: "Book Store",
    address: "Some mall",
    email: "",
    status: true
    }
  end

  let(:valid_headers) { {authorize: 'authorization-token'} }

  describe "GET /show" do
    it "renders a successful response" do
      brand = Brand.create! valid_attributes
      get brand_url(brand), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Brand" do
        expect {
          post brands_url,
               params: { brand: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Brand, :count).by(1)
      end

      it "renders a JSON response with the new brand" do
        post brands_url,
             params: { brand: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Brand" do
        expect {
          post brands_url,
               params: { brand: invalid_attributes }, as: :json
        }.to change(Brand, :count).by(0)
      end

      it "renders a JSON response with errors for the new brand" do
        post brands_url,
             params: { brand: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do {
        name: "PC Store",
        address: "Some mall",
        email: "pc_store@email.com",
        status: true
        }
      end

      it "updates the requested brand" do
        brand = Brand.create! valid_attributes
        patch brand_url(brand),
              params: { brand: new_attributes }, headers: valid_headers, as: :json
        brand.reload
        new_attributes.each_pair do |key, value|
          expect(brand[key]).to eq(value)
        end
      end

      it "renders a JSON response with the brand" do
        brand = Brand.create! valid_attributes
        patch brand_url(brand),
              params: { brand: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the brand" do
        brand = Brand.create! valid_attributes
        patch brand_url(brand),
              params: { brand: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested brand" do
      brand = Brand.create! valid_attributes
      expect {
        delete brand_url(brand), headers: valid_headers, as: :json
      }.to change(Brand, :count).by(-1)
    end
  end
end
