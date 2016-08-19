require "rails_helper"

RSpec.describe Backlog, type: :model do
  let(:backlog) { create(:backlog) }

  context "valitations" do
    it { is_expected.to validate_presence_of(:name) }
  end

  context "associations" do
    it { is_expected.to have_many(:stories) }
  end

  it do
    should have_db_column(:name).
      with_options(null: false, default: "", index: true)
  end
end
