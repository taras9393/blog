require 'rails_helper'

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
end
