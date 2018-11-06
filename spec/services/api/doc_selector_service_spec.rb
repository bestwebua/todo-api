require 'rails_helper'

RSpec.describe Api::DocSelectorService do
  let(:controller_object) do
    module V1; class SomeClass; end; end
    V1::SomeClass.new
  end

  describe '.call' do
    it 'returns path to static html file in public/docs' do
      expect(described_class.call(controller_object).to_s).to match /docs\/v1.html/
    end
  end
end
