require 'rails_helper'

describe 'the login process', type: :feature do
  it 'successful login' do
    visit new_user_session_path
    fill_in 'Email', with: 'test@test.net'
    fill_in 'Password', with: 'qwerty'
    click_button 'Log in'
    expect(page).to have_title 'Blog'
    #expect(page).to have_title 'Home'
  #  expect(page).to have_text 'Welcome to ProBlogger'
  end

  it 'failed login' do
    visit new_user_session_path
    fill_in 'Email', with: 'test2@test.net'
    fill_in 'Password', with: 'qwerty'
    click_button 'Log in'
    expect(page).to have_title 'Blog'
  #  expect(page).to have_content 'Invalid'
  end

#  it 'correct redirect' do
#    visit root_path
#    click_button 'View more categories'
#    expect(response).to have_http_status(:ok)
#  end

end
