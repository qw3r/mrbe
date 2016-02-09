require 'rails_helper'

RSpec.describe AuthService do
  describe '#authenticate' do
    subject { described_class.new(request).authenticate }
    let(:request) { ActionDispatch::Request.new(env) }


    context 'without credentials' do
      let(:env) { {} }

      it { is_expected.to be_guest }
    end


    context 'with invalid credentials' do
      let(:env) { basic_auth_header_for 'random_username', 'random_password' }

      it { is_expected.to be_guest }
    end


    context 'with valid credentials' do
      let(:user) { create :user }
      let(:env) { basic_auth_header_for user.username, user.password }

      it { is_expected.not_to be_guest }
      it { is_expected.to eq user }
    end
  end
end