require 'rails_helper'

RSpec.describe 'Tasks API', type: :request do
  let!(:user)      { create(:user) }
  let!(:project)   { create(:project, user: user) }
  let!(:tasks)     { create_list(:task, 10, project: project) }
  let(:project_id) { project.id }
  let(:id)         { tasks.first.id }
  let(:headers)    { valid_headers }

  describe 'GET /projects/:project_id/tasks' do
    before { get "/projects/#{project_id}/tasks", headers: headers }

    context 'project exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all project tasks' do
        expect(json.size).to eq(10)
      end
    end

    context 'project does not exist' do
      let(:project_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Project/)
      end
    end
  end

  describe 'GET /projects/:project_id/tasks/:id' do
    before { get "/projects/#{project_id}/tasks/#{id}", headers: headers }

    context 'project task exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the task' do
        expect(json['id']).to eq(id)
      end
    end

    context 'project task does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Task/)
      end
    end
  end

  describe 'PUT /projects/:project_id/tasks/:id' do
    let(:valid_attributes) { { name: 'Task Name', deadline: Time.now }.to_json }

    before { put "/projects/#{project_id}/tasks/#{id}", params: valid_attributes, headers: headers }

    context 'task exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the task' do
        updated_task = Task.find(id)
        expect(updated_task.name).to eq('Task Name')
      end
    end

    context 'task does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Task/)
      end
    end
  end

  describe 'DELETE /projects/:id' do
    before { delete "/projects/#{project_id}/tasks/#{id}", headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
