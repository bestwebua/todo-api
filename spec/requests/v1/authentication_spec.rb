# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'V1::Authentication API', type: :request do
  include Docs::V1::Authentication::Api

  let!(:user) { create(:user) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_credentials) { { email: user.email, password: user.password }.to_json }
  let(:invalid_credentials) { { email: Faker::Internet.email, password: Faker::Internet.password }.to_json }

  describe 'POST /api/auth/sign_in' do
    include Docs::V1::Authentication::SignIn

    context 'request is valid' do
      before { post '/api/auth/sign_in', params: valid_credentials, headers: headers }

      specify { expect(response).to have_http_status(:ok) }
      specify { expect(json['auth_token']).not_to be_nil }

      it 'sign in', :dox do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'request is invalid' do
      before { post '/api/auth/sign_in', params: invalid_credentials, headers: headers }

      specify { expect(response).to have_http_status(:unauthorized) }
      specify { expect(json['message']).to match(/Invalid credentials/) }

      it 'sign in fails', :dox do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'GET /api/auth/sign_out' do
    include Docs::V1::Authentication::SignOut

    before { get '/api/auth/sign_out', headers: valid_headers }

    context 'status code 204' do
      specify { expect(response).to have_http_status(:no_content) }

      it 'sign out', :dox do
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'current token should be expired' do
      before { get '/api/projects', headers: valid_headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns auth-token failure message' do
        expect(response.body).to match(/Invalid token/)
      end
    end
  end
end
