require 'rails_helper'

RSpec.describe Score, type: :model do
  let(:score) { create(:score) }

  context "validations" do
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:backlog_id) }
    it { is_expected.to validate_presence_of(:story_id) }
  end

  context "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:backlog) }
    it { is_expected.to belong_to(:story) }
  end
end
