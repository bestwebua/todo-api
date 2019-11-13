# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::DocSelectorService do
  let(:controller_object) do
    V1::SomeClass = Class.new # rubocop:disable RSpec/LeakyConstantDeclaration
    V1::SomeClass.new
  end

  describe '.call' do
    it 'returns path to static html file in public/docs' do
      expect(described_class.call(controller_object).to_s).to match(%r{docs/v1.html})
    end
  end
end
