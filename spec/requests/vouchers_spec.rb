require 'rails_helper'

# fail with: ActiveRecord::InvalidForeignKey: PG::ForeignKeyViolation: ERROR:
RSpec.describe "/vouchers", type: :request do

  let(:valid_attributes) do {
      balance: 200.99,
      currency: "USD",
      secret_code: "secriest-code",
      user_id: "1"
    }
  end

  let(:invalid_attributes) do {
      balance: 200.99,
      currency: "USD",
      secret_code: "",
      user_id: "1"
    }
  end

  let(:valid_headers) { {authorize: 'authorization-token'} }

  describe "GET /show" do
    it "renders a successful response" do
      voucher = Voucher.create! valid_attributes
      # /users/:user_id/vouchers
      get user_voucher_url(voucher), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Voucher" do
        expect {
          post vouchers_url,
               params: { voucher: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Voucher, :count).by(1)
      end

      it "renders a JSON response with the new voucher" do
        post vouchers_url,
             params: { voucher: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Voucher" do
        expect {
          post vouchers_url,
               params: { voucher: invalid_attributes }, as: :json
        }.to change(Voucher, :count).by(0)
      end

      it "renders a JSON response with errors for the new voucher" do
        post vouchers_url,
             params: { voucher: invalid_attributes }, headers: valid_headers, as: :json
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

      it "updates the requested voucher" do
        voucher = Voucher.create! valid_attributes
        patch voucher_url(voucher),
              params: { voucher: new_attributes }, headers: valid_headers, as: :json
        voucher.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the voucher" do
        voucher = Voucher.create! valid_attributes
        patch voucher_url(voucher),
              params: { voucher: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the voucher" do
        voucher = Voucher.create! valid_attributes
        patch voucher_url(voucher),
              params: { voucher: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested voucher" do
      voucher = Voucher.create! valid_attributes
      expect {
        delete voucher_url(voucher), headers: valid_headers, as: :json
      }.to change(Voucher, :count).by(-1)
    end
  end
end
