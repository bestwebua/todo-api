# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::ApplicationController, type: :controller do
  let!(:user) { create(:user) }

  describe '#authorize_request' do
    context 'auth token is passed' do
      before { allow(request).to receive(:headers).and_return(valid_headers) }

      it 'sets the current user' do
        expect(subject.send(:authorize_request)).to eq(user)
      end
    end

    context 'auth token is not passed' do
      before { allow(request).to receive(:headers).and_return(invalid_headers) }

      it 'raises MissingToken error' do
        expect { subject.send(:authorize_request) }.to raise_error(ExceptionHandler::MissingToken, /Missing token/)
      end
    end
  end
end
