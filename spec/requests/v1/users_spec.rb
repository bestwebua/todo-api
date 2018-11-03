require 'rails_helper'

RSpec.describe 'V1::User API', type: :request do
  include Docs::V1::Authentication::Api

  let(:user) { build(:user) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_attributes) { attributes_for(:user, password_confirmation: user.password) }

  describe 'POST /api/auth' do
    include Docs::V1::Authentication::SignUp

    context 'valid request' do
      before { post '/api/auth', params: valid_attributes.to_json, headers: headers }

      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Account created successfully/)
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end

      it 'sign up', :dox do
        expect(response).to have_http_status(201)
      end
    end

    describe 'invalid request' do
      context 'invalid auth data' do
        before { post '/api/auth', params: {}, headers: headers }

        it 'does not create a new user' do
          expect(response).to have_http_status(422)
        end

        it 'returns failure message' do
          expect(json['message']).to match(/Validation failed/)
        end

        it 'sign up fails', :dox do
          expect(response).to have_http_status(422)
        end
      end

      context 'passwords do not match' do
        let(:different_passwords) do
          valid_attributes.merge(password_confirmation: user.password.reverse)
        end

        before { post '/api/auth', params: different_passwords.to_json, headers: headers }

        it 'does not create a new user' do
          expect(response).to have_http_status(422)
        end

        it 'returns failure message' do
          expect(json['message']).to match(/Passwords don't match/)
        end
      end
    end

    context 'user with same the email exists' do
      before do
        2.times { post '/api/auth', params: valid_attributes.to_json, headers: headers }
      end

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message']).to match(/Account could not be created/)
      end
    end
  end
end