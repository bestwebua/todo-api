require 'rails_helper'

RSpec.describe 'Tasks API', type: :request do
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
    before { get "/api/projects/#{project_id}/tasks", headers: headers }

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

  describe 'GET /api/projects/:project_id/tasks/:id' do
    before { get "/api/projects/#{project_id}/tasks/#{id}", headers: headers }

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

  describe 'POST /api/projects/:project_id/tasks' do
    before { post "/api/projects/#{project_id}/tasks", params: valid_attributes, headers: headers }

    it 'returns status code 201' do
      expect(response).to have_http_status(201)
    end

    it 'creates the task' do
      expect(json['name']).to eq('Task Name')
      expect(json['position']).not_to be_nil
    end
  end

  describe 'PUT /api/projects/:project_id/tasks/:id' do
    context 'task exists' do
      before { put "/api/projects/#{project_id}/tasks/#{id}", params: valid_attributes, headers: headers }

      context 'task incomplete' do
        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end

        it 'updates the task' do
          expect(updated_task.name).to eq('Task Name')
        end
      end

      context 'task complete' do
        before do
          patch "/api/projects/#{project_id}/tasks/#{id}/complete", headers: headers
          put "/api/projects/#{project_id}/tasks/#{id}", params: valid_attributes, headers: headers
        end

        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end

        it 'returns error message' do
          expect(response.body).to match(/Can't update record. Task is already done/)
        end
      end
    end

    context 'task does not exist' do
      let(:id) { 0 }
      before { put "/api/projects/#{project_id}/tasks/#{id}", params: valid_attributes, headers: headers }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Task/)
      end
    end
  end

  describe 'PATH /api/projects/:project_id/tasks/:id/complete' do
    before { patch "/api/projects/#{project_id}/tasks/#{id}/complete", headers: headers }

    context 'mark as complete' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'updates the task' do
        expect(updated_task.done).to be(true)
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

  describe 'PATH /api/projects/:project_id/tasks/:id/position' do
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
    end
  end

  describe 'DELETE /api/projects/:id' do
    before { delete "/api/projects/#{project_id}/tasks/#{id}", headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
