require 'rails_helper'

RSpec.describe Auth::AuthenticateUserService do
  let(:user)                 { create :user, sign_out: true }
  subject(:valid_auth_obj)   { described_class.call(email: user.email, password: user.password) }
  subject(:invalid_auth_obj) { described_class.call(email: '', password: '') }

  describe '.call' do
    context 'valid credentials' do
      specify { expect { valid_auth_obj }.to change(user, :sign_out) }
      specify { expect(valid_auth_obj).not_to be_nil }
    end

    context 'invalid credentials' do
      specify do
        expect { invalid_auth_obj }.to raise_error(ExceptionHandler::AuthenticationError, /Invalid credentials/)
      end
    end
  end
end
