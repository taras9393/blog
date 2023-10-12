require 'rails_helper'

describe 'the login process', type: :feature do
  it 'successful login' do
    visit new_user_session_path
    fill_in 'Email', with: 'qwerty@qwerty.com'
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
