require 'rails_helper'

RSpec.describe 'V1::Authentication API', type: :request do
  include Docs::V1::Authentication::Api

  let!(:user) { create(:user) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_credentials) { { email: user.email, password: user.password }.to_json  }
  let(:invalid_credentials) { { email: Faker::Internet.email, password: Faker::Internet.password }.to_json }

  describe 'POST /api/auth/sign_in' do
    include Docs::V1::Authentication::SignIn

    context 'request is valid' do
      before { post '/api/auth/sign_in', params: valid_credentials, headers: headers }
      specify { expect(json['auth_token']).not_to be_nil }
      specify { expect(response).to have_http_status(200) }

      it 'sign in', :dox do
        expect(response).to have_http_status(200)
      end
    end

    context 'request is invalid' do
      before { post '/api/auth/sign_in', params: invalid_credentials, headers: headers }
      specify { expect(json['message']).to match(/Invalid credentials/) }
      specify { expect(response).to have_http_status(401) }

      it 'sign in', :dox do
        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'GET /api/auth/sign_out' do
    include Docs::V1::Authentication::SignOut

    before { get '/api/auth/sign_out', headers: valid_headers }

    context 'status code 204' do
      specify { expect(response).to have_http_status(204) }

      it 'sign out', :dox do
        expect(response).to have_http_status(204)
      end
    end

    context 'current token should be expired' do
      before { get '/api/projects', headers: valid_headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns auth-token failure message' do
        expect(response.body).to match(/Invalid token/)
      end
    end
  end
end
