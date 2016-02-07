require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_uniqueness_of(:username) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to have_secure_password }

  describe "#admin?" do
    subject { user.admin? }

    context "when user is admin" do
      let(:user) { create(:user, :admin) }
      it { is_expected.to be true }
    end


    context "when user is not admin" do
      let(:user) { create(:user) }
      it { is_expected.to be false }
    end
  end


end
