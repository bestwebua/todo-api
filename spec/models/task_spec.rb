require 'rails_helper'

RSpec.describe Task, type: :model do
  it { is_expected.to belong_to(:project) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:position) }
end
