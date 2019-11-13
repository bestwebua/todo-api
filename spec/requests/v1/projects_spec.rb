# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'V1::Projects API', type: :request do
  include Docs::V1::Projects::Api

  let!(:user)      { create :user }
  let!(:projects)  { create_list(:project, 2, user: user) }
  let(:project_id) { projects.first.id }
  let(:headers)    { valid_headers }

  describe 'GET /api/projects' do
    include Docs::V1::Projects::Index

    before { get '/api/projects', headers: headers }

    it 'returns projects' do
      expect(json).to match_json_schema('projects/index')
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'gets projects', :dox do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /api/projects' do
    include Docs::V1::Projects::Create

    let(:valid_attributes) { { title: 'Project Title', user_id: user.id }.to_json }

    context 'request is valid' do
      before { post '/api/projects', params: valid_attributes, headers: headers }

      it 'creates a project' do
        expect(json).to match_json_schema('projects/create')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(:created)
      end

      it 'create a project', :dox do
        expect(response).to have_http_status(:created)
      end
    end

    context 'request is invalid' do
      let(:invalid_attributes) { { title: nil }.to_json }

      before { post '/api/projects', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Title can't be blank/)
      end

      it 'does not create a project', :dox do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET /api/projects/:id' do
    include Docs::V1::Projects::Show

    before { get "/api/projects/#{project_id}", headers: headers }

    context 'record exists' do
      it 'returns the project' do
        expect(json).to match_json_schema('projects/show')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'show the project', :dox do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'record does not exist' do
      let(:project_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Project/)
      end

      it 'project not found', :dox do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'PATCH /api/projects/:id' do
    include Docs::V1::Projects::Update

    let(:valid_attributes) { { title: 'New Title' }.to_json }

    context 'record exists' do
      before { patch "/api/projects/#{project_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(json).to match_json_schema('projects/update')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'update a project', :dox do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'DELETE /api/projects/:id' do
    include Docs::V1::Projects::Delete

    before { delete "/api/projects/#{project_id}", headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(:no_content)
    end

    it 'delete a project', :dox do
      expect(response).to have_http_status(:no_content)
    end
  end
end
