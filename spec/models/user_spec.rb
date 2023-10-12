require 'rails_helper'
                                                                #UserModelUserModelUserModel
describe User, type: :model do
  let(:user) { create(:user) }

  it 'is expected to have a valid factory' do
    expect(user.valid?).to eq true
  end

  it { should have_many(:articles) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:nickname) }
  it { should validate_presence_of(:nickname) }

  it { should validate_uniqueness_of(:nickname).case_insensitive }

  #it { should_validate_length_of (:nickname).is_at_most(20) }
end
