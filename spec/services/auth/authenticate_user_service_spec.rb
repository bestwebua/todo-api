# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Auth::AuthenticateUserService do
  subject(:invalid_auth_obj) { described_class.call(email: '', password: '') }

  let(:valid_auth_obj) do
    described_class.call(email: user.email, password: user.password)
    user.reload
  end

  let(:user) { create :user, sign_out: true }

  describe '.call' do
    context 'when valid credentials' do
      it 'user sign_out status should be false' do
        expect { valid_auth_obj }.to change(user, :sign_out)
      end

      it 'returns an auth token' do
        expect(valid_auth_obj).not_to be_nil
      end
    end

    context 'when invalid credentials' do
      specify do
        expect { invalid_auth_obj }.to raise_error(ExceptionHandler::AuthenticationError, /Invalid credentials/)
      end
    end
  end
end
