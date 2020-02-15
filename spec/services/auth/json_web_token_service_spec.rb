# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Auth::JsonWebTokenService do
  let(:payload) { { user_id: 1 } }
  let(:fake_token) { token_generator(rand(1..100)) }

  context 'when secret key was assigned' do
    describe '.encode' do
      it 'returns jwt token' do
        expect(described_class.encode(payload)).not_to be_nil
      end
    end

    describe '.decode' do
      it 'returns payload data' do
        expect(described_class.decode(fake_token)).to include('user_id', 'exp')
      end
    end
  end

  context 'when secret key was not assigned' do
    before { stub_const('Auth::JsonWebTokenService::HMAC_SECRET', nil) }

    describe '.encode' do
      it 'raises InvalidSecretKey error' do
        expect { described_class.encode(payload) }
          .to raise_error(ExceptionHandler::InvalidSecretKey, /secret_key_base not assigned/)
      end
    end

    describe '.decode' do
      it 'raises InvalidSecretKey error' do
        expect { described_class.decode(fake_token) }
          .to raise_error(ExceptionHandler::InvalidSecretKey, /secret_key_base not assigned/)
      end
    end
  end
end
