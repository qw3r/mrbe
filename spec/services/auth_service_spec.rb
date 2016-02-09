require 'rails_helper'

RSpec.describe AuthService do
  describe '#authenticate' do
    subject { described_class.new(request).authenticate }
    let(:request) { ActionDispatch::Request.new(env) }


    context 'without credentials' do
      let(:env) { {} }

      it 'returns with a guest user' do
        expect(subject).to be_guest
      end
    end

  end
end