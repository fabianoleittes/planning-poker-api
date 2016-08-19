require 'rails_helper'

RSpec.describe Story, type: :model do
  let(:story) { create(:story) }

  context "validations" do
    it { is_expected.to validate_presence_of(:description) }
  end

  context "associations" do
    it { is_expected.to belong_to(:backlog) }
  end

  it do
    should have_db_column(:description).
      with_options(null: false, default: "")
  end
end
