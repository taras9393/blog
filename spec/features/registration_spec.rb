require 'rails_helper'

describe 'the sign_up process', type: :feature do
  it 'successful sign_up' do
    visit new_user_registration_path
    fill_in 'Nickname', with: Faker::Internet.username
    fill_in 'Email', with: Faker::Internet.email
    fill_in 'Password', with: 'qwerty'
    fill_in 'Password confirmation', with: 'qwerty'
    click_button 'Sign up'
    expect(page).to have_title 'Blog'
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
    expect(page).to have_text 'Password is too short'
    end
end
