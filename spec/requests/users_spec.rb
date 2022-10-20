require 'rails_helper'

RSpec.describe "Users", type: :request do
  
  let(:valid_attributes) do {
    username: "Bob",
    email: "bob@email.com",
    password: "bob-pass",
    password_confirmation: "bob-pass"
    }
  end

  let(:invalid_attributes) do {
    username: "Test",
    email: "test@email.com",
    password: "test-pass",
    password_confirmation: "testt-pass"
    }
  end

  let(:valid_headers) { {authorize: 'authorization-token'} }

  describe "GET /show" do
    it "renders a successful response" do
      user = User.create! valid_attributes
      get user_url(user), headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end
    
  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new User" do
        expect {
          post users_url,
               params: { user: valid_attributes }, headers: valid_headers, as: :json
        }.to change(User, :count).by(1)
      end

      it "renders a JSON response with the new user" do
        post users_url,
             params: { user: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new User" do
        expect {
          post users_url,
               params: { user: invalid_attributes }, as: :json
        }.to change(User, :count).by(0)
      end

      it "renders a JSON response with errors for the new user" do
        post users_url,
             params: { user: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do {
        username: "Test",
        email: "test@email.com",
        password: "test-pass",
        password_confirmation: "test-pass"
        }
      end

      it "updates the requested user" do
        user = User.create! valid_attributes
        put user_url(user),
              params: { user: new_attributes }, headers: valid_headers, as: :json
        user.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the user" do
        user = User.create! valid_attributes
        put user_url(user),
              params: { user: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the user" do
        user = User.create! valid_attributes
        put user_url(user),
              params: { user: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested user" do
      user = User.create! valid_attributes
      expect {
        delete user_url(user), headers: valid_headers, as: :json
      }.to change(User, :count).by(-1)
    end
  end

  
end
