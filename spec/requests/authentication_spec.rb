require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  describe 'POST /auth/sign_in' do
    let!(:user) { create(:user) }
    let(:headers) { valid_headers.except('Authorization') }
    let(:valid_credentials) { { email: user.email, password: user.password }.to_json  }
    let(:invalid_credentials) { { email: Faker::Internet.email, password: Faker::Internet.password }.to_json  }

    context 'request is valid' do
      before { post '/auth/sign_in', params: valid_credentials, headers: headers }
      specify { expect(json['auth_token']).not_to be_nil }
    end

    context 'request is invalid' do
      before { post '/auth/sign_in', params: invalid_credentials, headers: headers }
      specify { expect(json['message']).to match(/Invalid credentials/) }
    end
  end
end
