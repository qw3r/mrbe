require 'rails_helper'

RSpec.describe Trick, :type => :model do
  it { is_expected.to belong_to(:dog) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to delegate_method(:user).to(:dog) }
end
