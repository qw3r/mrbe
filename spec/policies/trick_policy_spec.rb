require 'rails_helper'

RSpec.describe TrickPolicy do
  subject { described_class }
  let(:dog) { create :dog }
  let(:trick) { create :trick, dog: dog }

  context 'for guest (unpersisted) user' do
    let(:user) { build :user }

    permissions :show? do
      it 'grants access' do
        expect(subject).to permit(user, trick)
      end
    end

    permissions :create? do
      it 'denies access' do
        expect(subject).not_to permit(user, trick)
      end
    end

    permissions :update? do
      it 'denies access' do
        expect(subject).not_to permit(user, trick)
      end
    end

    permissions :destroy? do
      it 'denies access' do
        expect(subject).not_to permit(user, trick)
      end
    end
  end


  context 'for normal (persisted) user' do
    let(:user) { create :user }

    permissions :show? do
      it 'grants access' do
        expect(subject).to permit(user, trick)
      end
    end

    permissions :create? do
      it 'grants access if the user owns the parent record' do
        trick = create :trick, dog: create(:dog, user: user)
        expect(subject).to permit(user, trick)
      end

      it 'denies access if the user does not own the parent record' do
        expect(subject).not_to permit(user, trick)
      end
    end

    permissions :update? do
      it 'grants access if user owns the record' do
        trick = create :trick, dog: create(:dog, user: user)
        expect(subject).to permit(user, trick)
      end

      it 'denies access if user does not own the record' do
        expect(subject).not_to permit(user, trick)
      end
    end

    permissions :destroy? do
      it 'grants access if user owns the record' do
        trick = create :trick, dog: create(:dog, user: user)
        expect(subject).to permit(user, trick)
      end

      it 'denies access if user does not own the record' do
        expect(subject).not_to permit(user, trick)
      end
    end
  end


  context 'for admin user' do
    let(:user) { create :user, :admin }

    permissions :show? do
      it 'grants access' do
        expect(subject).to permit(user, trick)
      end
    end

    permissions :create? do
      it 'grants access' do
        expect(subject).to permit(user, trick)
      end
    end

    permissions :update? do
      it 'grants access' do
        expect(subject).to permit(user, trick)
      end
    end

    permissions :destroy? do
      it 'grants access' do
        expect(subject).to permit(user, trick)
      end
    end
  end
end
