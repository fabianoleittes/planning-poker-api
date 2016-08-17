require "rails_helper"

RSpec.describe Backlog, type: :model do
  let(:backlog) { create(:backlog) }

  context "valitations" do
    it { is_expected.to validate_presence_of(:name) }
  end

  it do
    should have_db_column(:name).
      with_options(null: false, default: "", index: true)
  end
end
