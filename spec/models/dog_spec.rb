require 'rails_helper'

RSpec.describe Dog, :type => :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:tricks).dependent(:destroy) }
  it { is_expected.to validate_presence_of(:name) }
end
