require 'rails_helper'

RSpec.describe Auth::AuthorizeRequestService do
  let(:user)                    { create :user }
  let(:header)                  { { 'Authorization' => token_generator(user.id) } }
  subject(:invalid_request_obj) { described_class.call }
  subject(:request_obj)         { described_class.call(header) }

  describe '#call' do
    context 'valid request' do
      it 'returns user object' do
        expect(request_obj[:user]).to eq(user)
      end
    end

    context 'invalid request' do
      context 'missing token' do
        it 'raises a MissingToken error' do
          expect { invalid_request_obj }.to raise_error(ExceptionHandler::MissingToken, 'Missing token')
        end
      end

      context 'invalid token' do
        subject(:invalid_request_obj) do
          described_class.call('Authorization' => token_generator(5))
        end

        it 'raises an InvalidToken error' do
          expect { invalid_request_obj }.to raise_error(ExceptionHandler::InvalidToken, /Invalid token/)
        end
      end

      context 'expired token' do
        let(:header) { { 'Authorization' => expired_token_generator(user.id) } }
        subject(:request_obj) { described_class.call(header) }

        it 'raises ExceptionHandler::ExpiredSignature error' do
          expect { request_obj }.to raise_error(ExceptionHandler::InvalidToken, /Signature has expired/)
        end
      end
    end

    context 'fake token' do
      let(:header) { { 'Authorization' => 'foobar' } }
      subject(:invalid_request_obj) { described_class.call(header) }

      it 'handles JWT::DecodeError' do
        expect { invalid_request_obj }.to raise_error(ExceptionHandler::InvalidToken, /Not enough or too many segments/)
      end
    end
  end
end
