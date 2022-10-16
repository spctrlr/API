require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    
    it 'returns all users' do
      get "/users"
      expect(JSON.parse(response.body).size).to eq(2)
    end

    it 'returns status code 200' do
      get "/users"
      expect(response).to have_http_status(:success)
    end
  end


  describe "post a question route", :type => :request do
    # missing token error
    before do
      post "/login", params: { "user": {
        "username": "Marko", 
        "email": "marko@email.com",
        "password": "MarkoPass",
        "password_confirmation": "MarkoPass"
        }
    }
    end

    it 'returns the username' do
      expect(JSON.parse(response.body)['username']).to eq('Marko')
    end
    
    it 'returns the email' do
      expect(JSON.parse(response.body)['email']).to eq('marko@email.com')
    end
    
    it 'returns the password' do
      expect(JSON.parse(password.body)['service']).to eq('MarkoPass')
    end
    
    it 'returns the password_confirmation' do
      expect(JSON.parse(response.body)['password_confirmation']).to eq('MarkoPass')
    end
    
    it 'returns a created status' do
      expect(response).to have_http_status(:created)
    end
  end
end
