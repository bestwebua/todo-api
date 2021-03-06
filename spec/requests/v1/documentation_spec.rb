# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'V1::Documentation', type: :request do
  before(:context) do
    current_doc = Rails.public_path.join('docs', 'v1.html').to_s
    @env = RspecFileChef::FileChef.new(current_doc)
    @env.make
  end

  after(:context) do
    @env.clear
  end

  describe 'GET /api/documentation' do
    describe 'returns documentation' do
      context 'when without headers' do
        before { get '/api/documentation' }

        it 'returns status code 200' do
          expect(response).to have_http_status(:ok)
        end

        it 'render static html' do
          expect(response.body).to include('<!DOCTYPE html>')
        end
      end

      context 'when with existing version' do
        let(:headers) { { accept: 'application/v1' } }

        before { get '/api/documentation', headers: headers }

        it 'returns status code 200' do
          expect(response).to have_http_status(:ok)
        end

        it 'render static html' do
          expect(response.body).to include('<!DOCTYPE html>')
        end
      end
    end

    describe 'not returns documentation' do
      context 'when static documentation file not exists' do
        before do
          allow(Api::DocSelectorService).to receive(:call).and_return('v42')
          get '/api/documentation'
        end

        it 'returns status code 404' do
          expect(response).to have_http_status(:not_found)
        end

        it 'returns error message' do
          expect(body).to include('Documentation api-file not found.')
        end
      end
    end
  end
end
