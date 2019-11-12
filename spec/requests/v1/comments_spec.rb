# frozen_string_literal: true

require 'rails_helper'
include ActionDispatch::TestProcess

RSpec.describe 'V1::Comments API', type: :request do
  include Docs::V1::Comments::Api

  let(:headers)     { valid_headers }
  let(:user)        { create(:user) }
  let(:project)     { create(:project, user: user) }
  let(:project_id)  { project.id }
  let(:tasks)       { create_list(:task, 2, project: project) }
  let(:id)          { tasks.first.id }
  let(:task)        { Task.find(id) }
  let(:task_id)     { task.id }
  let!(:comments)   { create_list(:comment, 2, task: task) }
  let(:comment_id)  { comments.first.id }
  let(:comment)     { Comment.find(comment_id) }

  describe 'GET /api/projects/:project_id/tasks/:id/comments' do
    include Docs::V1::Comments::Index

    before { get "/api/projects/#{project_id}/tasks/#{task_id}/comments", headers: headers }

    it 'returns all task comments' do
      expect(json).to match_json_schema('comments/index')
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'gets comments', :dox do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /api/projects/:project_id/tasks/:id/comments' do
    include Docs::V1::Comments::Create

    let(:post_path) { "/api/projects/#{project_id}/tasks/#{task_id}/comments" }

    context 'valid attributes' do
      describe 'without image' do
        let(:valid_attributes) { { body: 'Comment' }.to_json }

        before { post(post_path, params: valid_attributes, headers: headers) }

        it 'creates a comment' do
          expect(json).to match_json_schema('comments/create')
        end

        it 'returns status code 201' do
          expect(response).to have_http_status(:created)
        end

        it 'create a comment', :dox do
          expect(response).to have_http_status(:created)
        end
      end

      describe 'with image' do
        let(:image_file) { fixture_file_upload(Rails.root.join('spec/fixtures/files', 'ror.png')) }
        let(:valid_attributes) { { body: 'Comment', image: image_file } }

        before { post(post_path, params: valid_attributes, headers: headers) }

        it 'creates a comment with img-src link' do
          expect(json).to match_json_schema('comments/create')
        end

        it 'returns status code 201' do
          expect(response).to have_http_status(:created)
        end

        it 'create a comment with image', :dox do
          expect(response).to have_http_status(:created)
        end
      end
    end

    context 'invalid attributes' do
      let(:not_image_file) { fixture_file_upload(Rails.root.join('spec/fixtures/files', 'ror.txt')) }

      context 'wrong comment attribute' do
        let(:invalid_attributes) { { body: '' }.to_json }

        before { post(post_path, params: invalid_attributes, headers: headers) }

        it 'doesnt create a comment' do
          expect(task.comments.count).to eq(2)
        end

        it 'returns status code 422' do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context 'wrong MIME type' do
        let(:invalid_attributes) { { body: 'Comment', image: not_image_file } }

        before { post(post_path, params: invalid_attributes, headers: headers) }

        it 'doesnt create a comment' do
          expect(task.comments.count).to eq(2)
        end

        it 'returns status code 422' do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context 'wrong attributes and MIME type' do
        let(:invalid_attributes) { { body: nil, image: not_image_file } }

        before { post(post_path, params: invalid_attributes, headers: headers, as: :json) }

        it 'create a comment fails', :dox do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe 'DELETE /api/projects/:project_id/tasks/:id/comments/:id' do
    include Docs::V1::Comments::Delete

    before { delete "/api/projects/#{project_id}/tasks/#{task_id}/comments/#{comment_id}", headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(:no_content)
    end

    it 'delete a comment', :dox do
      expect(response).to have_http_status(:no_content)
    end
  end
end
