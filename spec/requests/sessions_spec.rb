require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe 'POST #create' do
  let!(:user) { create(:user) }

  context 'with valid credentials' do
    it 'authenticates the user and returns a success response' do
      post '/login', params: { username: user.username, password: 'password' }

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to include('token')
      #  If the user logins with correct credentials, it should return a token.
    end
  end

  context 'with invalid credentials' do
    it 'does not authenticate the user and returns an error response' do
      post '/login', params: { username: user.username, password: 'wrong_password' } 
  # pretend to input wrong_password so it does not match
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
end

