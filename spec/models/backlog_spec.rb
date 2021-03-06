require "rails_helper"

RSpec.describe Backlog, type: :model do
  let(:backlog) { create(:backlog) }

  context "valitations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:user_id) }
  end

  context "associations" do
    it { is_expected.to have_many(:stories) }
    it { is_expected.to belong_to(:user) }
  end

  it do
    should have_db_column(:name).
      with_options(null: false, default: "", index: true)
  end

  it do
    should have_db_column(:user_id).
      with_options(null: false, index: true)
  end
end
