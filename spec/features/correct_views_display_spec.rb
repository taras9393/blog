require 'rails_helper'


describe 'getting all user list', type: :feature do

  before(:each) do
     User.create(email: "testadmin@admin.com", password: "qwerty",
      password_confirmation: "qwerty", nickname: "testadmin", admin: true)
  end

  before(:each) do
     User.create(email: "qwerty@qwerty.com", password: "qwerty",
      password_confirmation: "qwerty", nickname: "qwerty")
  end

  it 'should be forbidden for non-admin' do
    visit new_user_session_path
    fill_in 'Email', with: 'qwerty@qwerty.com'
    fill_in 'Password', with: 'qwerty'
    click_button 'Log in'
    visit users_path
    expect(page).to have_content 'Access denied'
  end

  it 'should be allowed for admin' do
    visit new_user_session_path
    fill_in 'Email', with: 'testadmin@admin.com'
    fill_in 'Password', with: 'qwerty'
    click_button 'Log in'
    visit users_path
    expect(page).to have_content 'List of users'
  end
end

describe 'feature of adding new categories', type: :feature do

    before(:each) do
       User.create(email: "testadmin@admin.com", password: "qwerty",
        password_confirmation: "qwerty", nickname: "testadmin", admin: true)
    end

    before(:each) do
       User.create(email: "qwerty@qwerty.com", password: "qwerty",
        password_confirmation: "qwerty", nickname: "qwerty")
    end


  it 'should be available for admin-user' do
    visit new_user_session_path
    fill_in 'Email', with: 'testadmin@admin.com'
    fill_in 'Password', with: 'qwerty'
    click_button 'Log in'
    visit categories_path
    expect(page).to have_content 'Add new category'
  end

  it 'should not be available for users' do
    visit new_user_session_path
    fill_in 'Email', with: 'qwerty@qwerty.com'
    fill_in 'Password', with: 'qwerty'
    click_button 'Log in'
    visit categories_path
    expect(page).to have_content 'Offer new category'
    visit new_category_path
    expect(page).to have_content 'Access denied'
  end
end

describe 'creating of new article', type: :feature do
  context 'with not authenticate user' do
   it 'should show message for signing in ' do
    visit new_article_path
    expect(page).to have_content 'You need to sign in'
   end
  end
end
