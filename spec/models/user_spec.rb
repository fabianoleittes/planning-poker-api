require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  context "validations" do
    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:kind) }
  end

  it do
    should have_db_column(:full_name).
      with_options(null: false, default: "")
  end

  it do
    should have_db_column(:email).
      with_options(null: false, default: "")
  end

  it do
    should have_db_column(:kind).
      with_options(null: false, default: "")
  end
end
