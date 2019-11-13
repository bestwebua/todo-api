# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Auth::AuthorizeRequestService do
  subject(:request_obj)         { described_class.call(header) }

  let(:user)                    { create :user }
  let(:header)                  { { 'Authorization' => token_generator(user.id) } }

  let(:invalid_request_obj) { described_class.call }

  describe '.call' do
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
        subject(:request_obj) { described_class.call(header) }

        let(:header) { { 'Authorization' => expired_token_generator(user.id) } }

        it 'raises ExceptionHandler::ExpiredSignature error' do
          expect { request_obj }.to raise_error(ExceptionHandler::InvalidToken, /Signature has expired/)
        end
      end
    end

    context 'fake token' do
      subject(:invalid_request_obj) { described_class.call(header) }

      let(:header) { { 'Authorization' => 'foobar' } }

      it 'handles JWT::DecodeError' do
        expect { invalid_request_obj }.to raise_error(ExceptionHandler::InvalidToken, /Not enough or too many segments/)
      end
    end
  end
end
