require 'rails_helper'
include ActionDispatch::TestProcess

RSpec.describe 'V1::Comments API', type: :request do
  let(:headers)     { valid_headers }
  let(:user)        { create(:user) }
  let(:project)     { create(:project, user: user) }
  let(:project_id)  { project.id }
  let(:tasks)       { create_list(:task, 10, project: project) }
  let(:id)          { tasks.first.id }
  let(:task)        { Task.find(id) }
  let(:task_id)     { task.id }
  let!(:comments)   { create_list(:comment, 10, task: task) }
  let(:comment_id)  { comments.first.id }
  let(:comment)     { Comment.find(comment_id) }

  describe 'GET /api/projects/:project_id/tasks/:id/comments' do
    before { get "/api/projects/#{project_id}/tasks/#{task_id}/comments", headers: headers }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns all task comments' do
      expect(json.size).to eq(10)
    end
  end

  describe 'POST /api/projects/:project_id/tasks/:id/comments' do
    let(:post_path) { "/api/projects/#{project_id}/tasks/#{task_id}/comments" }

    context 'valid attributes' do
      describe 'without image' do
        let(:valid_attributes) { { body: 'Comment' }.to_json }
        before { post(post_path, params: valid_attributes, headers: headers) }

        it 'creates a comment' do
          expect(json['body']).to eq('Comment')
        end

        it 'returns status code 201' do
          expect(response).to have_http_status(201)
        end
      end

      describe 'with image' do
        let(:image_file) { fixture_file_upload(Rails.root.join('spec/fixtures/files', 'ror.png')) }
        let(:valid_attributes) { { body: 'Comment', image: image_file } }
        before { post(post_path, params: valid_attributes, headers: headers) }

        it 'creates a comment' do
          expect(json['body']).to eq('Comment')
        end

        it 'creates an img-src link' do
          expect(json['img_src']).not_to be_nil
        end

        it 'returns status code 201' do
          expect(response).to have_http_status(201)
        end
      end
    end

    context 'invalid attributes' do
      context 'wrong comment attribute' do
        let(:invalid_attributes) { { body: '' }.to_json }
        before { post(post_path, params: invalid_attributes, headers: headers) }

        it 'doesnt create a comment' do
          expect(task.comments.count).to eq(10)
        end

        it 'returns status code 201' do
          expect(response).to have_http_status(422)
        end
      end

      context 'wrong MIME type' do
        let(:not_image_file) { fixture_file_upload(Rails.root.join('spec/fixtures/files', 'ror.txt')) }
        let(:invalid_attributes) { { body: 'Comment', image: not_image_file } }
        before { post(post_path, params: invalid_attributes, headers: headers) }

        it 'doesnt create a comment' do
          expect(task.comments.count).to eq(10)
        end

        it 'returns status code 201' do
          expect(response).to have_http_status(422)
        end
      end
    end
  end

  describe 'DELETE /api/projects/:project_id/tasks/:id/comments/:id' do
    before { delete "/api/projects/#{project_id}/tasks/#{task_id}/comments/#{comment_id}", headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
