# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'V1::Tasks API', type: :request do
  include Docs::V1::Tasks::Api

  let!(:user)            { create(:user) }
  let!(:project)         { create(:project, user: user) }
  let!(:tasks)           { create_list(:task, 2, project: project) }
  let(:project_id)       { project.id }
  let(:id)               { tasks.first.id }
  let(:next_id)          { tasks[1].id }
  let(:headers)          { valid_headers }
  let(:updated_task)     { Task.find(id) }
  let(:next_task)        { Task.find(next_id) }
  let(:valid_attributes) { { name: 'Task Name', deadline: Time.zone.now }.to_json }

  describe 'GET /api/projects/:project_id/tasks' do
    include Docs::V1::Tasks::Index

    before { get "/api/projects/#{project_id}/tasks", headers: headers }

    context 'when project exists' do
      it 'returns all project tasks' do
        expect(json).to match_json_schema('tasks/index')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'gets tasks', :dox do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when project does not exist' do
      let(:project_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Project/)
      end
    end
  end

  describe 'POST /api/projects/:project_id/tasks' do
    include Docs::V1::Tasks::Create

    context 'when request is valid' do
      before { post "/api/projects/#{project_id}/tasks", params: valid_attributes, headers: headers }

      it 'creates the task' do
        expect(json).to match_json_schema('tasks/create')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(:created)
      end

      it 'create a task', :dox do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when request is invalid' do
      before do
        post "/api/projects/#{project_id}/tasks", params: { name: nil }.to_json, headers: headers
      end

      it 'returns error message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'does not create a task', :dox do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET /api/projects/:project_id/tasks/:id' do
    include Docs::V1::Tasks::Show

    before { get "/api/projects/#{project_id}/tasks/#{id}", headers: headers }

    context 'when project task exists' do
      it 'returns the task' do
        expect(json).to match_json_schema('tasks/show')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'show the task', :dox do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when project task does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Task/)
      end

      it 'task not found', :dox do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'PATCH /api/projects/:project_id/tasks/:id' do
    include Docs::V1::Tasks::Update

    context 'when task exists' do
      before { patch "/api/projects/#{project_id}/tasks/#{id}", params: valid_attributes, headers: headers }

      context 'when task incomplete' do
        it 'updates the task' do
          expect(json).to match_json_schema('tasks/update')
        end

        it 'returns status code 200' do
          expect(response).to have_http_status(:ok)
        end

        it 'update a task', :dox do
          expect(response).to have_http_status(:ok)
        end
      end

      context 'when task complete' do
        before do
          patch "/api/projects/#{project_id}/tasks/#{id}/complete", headers: headers
          patch "/api/projects/#{project_id}/tasks/#{id}", params: valid_attributes, headers: headers
        end

        it 'returns status code 422' do
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'returns error message' do
          expect(response.body).to match(/Can't update record. Task is already done/)
        end

        it 'update a task fails', :dox do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context 'when task does not exist' do
      let(:id) { 0 }

      before { patch "/api/projects/#{project_id}/tasks/#{id}", params: valid_attributes, headers: headers }

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
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
      expect(response).to have_http_status(:no_content)
    end

    it 'delete a task', :dox do
      expect(response).to have_http_status(:no_content)
    end
  end

  describe 'PATCH /api/projects/:project_id/tasks/:id/complete' do
    include Docs::V1::Tasks::Complete

    before { patch "/api/projects/#{project_id}/tasks/#{id}/complete", headers: headers }

    context 'when mark as complete' do
      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'updates the task' do
        expect(updated_task.done).to be(true)
      end

      it 'trigger task status', :dox do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when mark as incomplete' do
      before { patch "/api/projects/#{project_id}/tasks/#{id}/complete", headers: headers }

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'updates the task' do
        expect(updated_task.done).to be(false)
      end
    end
  end

  describe 'PATCH /api/projects/:project_id/tasks/:id/position' do
    include Docs::V1::Tasks::Position

    let(:move_up_position) { patch "/api/projects/#{project_id}/tasks/#{next_id}/position", headers: headers }

    context 'when shift all tasks positions' do
      let(:move_up_position_with_reload) do
        move_up_position
        updated_task.reload
        next_task.reload
      end

      it 'move up current task position' do
        expect { move_up_position_with_reload }.to change(next_task, :position).from(2).to(1)
      end

      it 'shift other task position' do
        expect { move_up_position_with_reload }.to change(updated_task, :position)
      end
    end

    context 'when current task position changed' do
      before { move_up_position }

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'change task position', :dox do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
