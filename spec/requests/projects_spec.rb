require 'rails_helper'

RSpec.describe 'Projects API', type: :request do
  include Docs::V1::Projects::Api

  let!(:user)      { create :user }
  let!(:projects)  { create_list(:project, 10, user: user) }
  let(:project_id) { projects.first.id }
  let(:headers)    { valid_headers }

  describe 'GET /api/projects' do
    include Docs::V1::Projects::Index

    before { get '/api/projects', headers: headers }

    it 'returns projects' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'gets a projects', :dox do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/projects' do
    include Docs::V1::Projects::Create

    let(:valid_attributes) { { title: 'Project Title', user_id: user.id }.to_json }

    context 'request is valid' do
      before { post '/api/projects', params: valid_attributes, headers: headers }

      it 'creates a project' do
        expect(json['title']).to eq('Project Title')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'create a project', :dox do
        expect(response).to have_http_status(201)
      end
    end

    context 'request is invalid' do
      let(:invalid_attributes) { { title: nil }.to_json }
      before { post '/api/projects', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Title can't be blank/)
      end

      it 'does not create a project', :dox do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'GET /api/projects/:id' do
    include Docs::V1::Projects::Show

    before { get "/api/projects/#{project_id}", headers: headers }

    context 'record exists' do
      it 'returns the project' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(project_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'show the project', :dox do
        expect(response).to have_http_status(200)
      end
    end

    context 'record does not exist' do
      let(:project_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Project/)
      end

      it 'project not found', :dox do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'PATCH /api/projects/:id' do
    include Docs::V1::Projects::Update

    let(:valid_attributes) { { title: 'New Title' }.to_json }

    context 'record exists' do
      before { patch "/api/projects/#{project_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).not_to be_empty
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'update a project', :dox do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE /api/projects/:id' do
    include Docs::V1::Projects::Delete

    before { delete "/api/projects/#{project_id}", headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end

    it 'delete a project', :dox do
      expect(response).to have_http_status(204)
    end
  end
end
