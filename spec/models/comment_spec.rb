# frozen_string_literal: true

require 'rails_helper'
include ActionDispatch::TestProcess

RSpec.describe Comment, type: :model do
  describe 'active record options' do
    it { is_expected.to belong_to(:task) }
    it { is_expected.to validate_presence_of(:body) }
  end

  describe 'active storage options' do
    let(:files_path) { 'spec/fixtures/files' }
    let(:image_file) { fixture_file_upload(Rails.root.join(files_path, 'ror.png'), 'image/png') }
    let(:not_image_file) { fixture_file_upload(Rails.root.join(files_path, 'ror.txt')) }

    let(:user) { create :user }
    let(:project) { create :project }
    let(:task) { create :task }

    it 'valid depending on file presence' do
      expect(build(:comment, image: image_file)).to be_valid
    end

    it 'invalid depending on file presence' do
      expect(build(:comment, image: not_image_file)).to be_invalid
    end
  end
end
