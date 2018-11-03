require 'rails_helper'

RSpec.describe 'V1::Tasks API', type: :request do
  include Docs::V1::Tasks::Api

  let!(:user)            { create(:user) }
  let!(:project)         { create(:project, user: user) }
  let!(:tasks)           { create_list(:task, 10, project: project) }
  let(:project_id)       { project.id }
  let(:id)               { tasks.first.id }
  let(:next_id)          { tasks[1].id }
  let(:headers)          { valid_headers }
  let(:updated_task)     { Task.find(id) }
  let(:next_task)        { Task.find(next_id) }
  let(:valid_attributes) { { name: 'Task Name', deadline: Time.now }.to_json }

  describe 'GET /api/projects/:project_id/tasks' do
    include Docs::V1::Tasks::Index

    before { get "/api/projects/#{project_id}/tasks", headers: headers }

    context 'project exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all project tasks' do
        expect(json.size).to eq(10)
      end

      it 'gets tasks', :dox do
        expect(response).to have_http_status(200)
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

  describe 'POST /api/projects/:project_id/tasks' do
    include Docs::V1::Tasks::Create

    context 'request is valid' do
      before { post "/api/projects/#{project_id}/tasks", params: valid_attributes, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'creates the task' do
        expect(json['name']).to eq('Task Name')
        expect(json['position']).not_to be_nil
      end

      it 'create a task', :dox do
        expect(response).to have_http_status(201)
      end
    end

    context 'request is invalid' do
      before do
        post "/api/projects/#{project_id}/tasks", params: { name: nil }.to_json, headers: headers
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'creates the task' do
        expect(json['name']).to be_nil
        expect(json['position']).to be_nil
      end

      it 'does not create a task', :dox do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'GET /api/projects/:project_id/tasks/:id' do
    include Docs::V1::Tasks::Show

    before { get "/api/projects/#{project_id}/tasks/#{id}", headers: headers }

    context 'project task exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the task' do
        expect(json['id']).to eq(id)
      end

      it 'show the task', :dox do
        expect(response).to have_http_status(200)
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

      it 'task not found', :dox do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'PATCH /api/projects/:project_id/tasks/:id' do
    include Docs::V1::Tasks::Update

    context 'task exists' do
      before { patch "/api/projects/#{project_id}/tasks/#{id}", params: valid_attributes, headers: headers }

      context 'task incomplete' do
        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end

        it 'updates the task' do
          expect(updated_task.name).to eq('Task Name')
        end

        it 'update a task', :dox do
          expect(response).to have_http_status(200)
        end
      end

      context 'task complete' do
        before do
          patch "/api/projects/#{project_id}/tasks/#{id}/complete", headers: headers
          patch "/api/projects/#{project_id}/tasks/#{id}", params: valid_attributes, headers: headers
        end

        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end

        it 'returns error message' do
          expect(response.body).to match(/Can't update record. Task is already done/)
        end

        it 'update a task fails', :dox do
          expect(response).to have_http_status(422)
        end
      end
    end

    context 'task does not exist' do
      let(:id) { 0 }
      before { patch "/api/projects/#{project_id}/tasks/#{id}", params: valid_attributes, headers: headers }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Task/)
      end
    end
  end

  describe 'DELETE /api/projects/:id' do
    include Docs::V1::Tasks::Delete

    before { delete "/api/projects/#{project_id}/tasks/#{id}", headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end

    it 'delete a task', :dox do
      expect(response).to have_http_status(204)
    end
  end

  describe 'PATCH /api/projects/:project_id/tasks/:id/complete' do
    include Docs::V1::Tasks::Complete

    before { patch "/api/projects/#{project_id}/tasks/#{id}/complete", headers: headers }

    context 'mark as complete' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'updates the task' do
        expect(updated_task.done).to be(true)
      end

      it 'trigger task status', :dox do
        expect(response).to have_http_status(200)
      end
    end

    context 'mark as incomplete' do
      before { patch "/api/projects/#{project_id}/tasks/#{id}/complete", headers: headers }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'updates the task' do
        expect(updated_task.done).to be(false)
      end
    end
  end

  describe 'PATCH /api/projects/:project_id/tasks/:id/position' do
    include Docs::V1::Tasks::Position

    let(:move_up_position) { patch "/api/projects/#{project_id}/tasks/#{next_id}/position", headers: headers }

    context 'shift all tasks positions' do
      let(:move_up_position_with_reload) do
        move_up_position
        updated_task.reload
        next_task.reload
      end

      it 'move up current task position' do
        expect { move_up_position_with_reload }.to change { next_task.position }.from(2).to(1)
      end

      it 'shift other task position' do
        expect { move_up_position_with_reload }.to change(updated_task, :position)
      end
    end

    context 'current task position changed' do
      before { move_up_position }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'change task position', :dox do
        expect(response).to have_http_status(200)
      end
    end
  end
end