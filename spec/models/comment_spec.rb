require 'rails_helper'

describe Comment, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:article) }

  it { should validate_presence_of(:body) }
end
