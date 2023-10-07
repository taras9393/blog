require 'rails_helper'

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

describe Article, type: :model do

  it { should belong_to(:user) }
  it { should belong_to(:category) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:category_id) }

  it { should validate_uniqueness_of(:title).case_insensitive }

end

describe UsersController, type: :controller do
 it { should use_before_action(:authenticate_user!) }
end

describe 'the login process', type: :feature do
  it 'successful login' do
    p User.find_by(email: 'ttershak@gmail.com')
    visit new_user_session_path
    fill_in 'Email', with: 'ttershak@gmail.com'
    fill_in 'Password', with: 'qwerty'
    click_button 'Log in'
    expect(page).to have_title 'Blog'
    expect(page).to have_content 'Signed in successfully'
  end

  it 'failed login' do
    visit new_user_session_path
    fill_in 'Email', with: 'test2@test.net'
    fill_in 'Password', with: 'qwerty'
    click_button 'Log in'
    expect(page).to have_title 'Blog'
    expect(page).to have_content 'Invalid Email or password'
  end
end

  describe 'the sign_up process', type: :feature do
    it 'successful sign_up' do
      visit new_user_registration_path
      fill_in 'Nickname', with: 'olololo'
      fill_in 'Email', with: 'user@user.net'
      fill_in 'Password', with: 'qwerty'
      fill_in 'Password confirmation', with: 'qwerty'
      click_button 'Sign up'
      expect(page).to have_title 'Blog'
      #expect(page).to have_title 'Home'
      expect(page).to have_text 'Welcome to ProBlogger'
    end

    it 'failed sign_up' do
      visit new_user_registration_path
      fill_in 'Nickname', with: 'olololo'
      fill_in 'Email', with: 'user@user.net'
      fill_in 'Password', with: 'qwer'
      fill_in 'Password confirmation', with: 'qwer'
      click_button 'Sign up'
      expect(page).to have_title 'Blog'
      #expect(page).to have_title 'Home'
      expect(page).to have_text 'Password is too short'
      end
end
