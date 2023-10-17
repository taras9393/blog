require 'rails_helper'

describe 'user creating', type: :feature do
  it 'should add new user to database' do
    expect {
      visit new_user_registration_path
      fill_in 'Nickname', with: 'asdfgh'
      fill_in 'Email', with: 'asdfgh@example.com'
      fill_in 'Password', with: 'qwerty'
      fill_in 'Password confirmation', with: 'qwerty'
      click_button 'Sign up'
    }.to change { User.count }.by(1)
  end

  it 'should NOT add new user to database' do
    expect {
      visit new_user_registration_path
      fill_in 'Nickname', with: 'asdfgh'
      fill_in 'Email', with: 'asdfgh@example.c.om'
      fill_in 'Password', with: 'qwerty'
      fill_in 'Password confirmation', with: 'qwertypp'
      click_button 'Sign up'
    }.to change { User.count }.by(0)
  end
end

describe 'article creating', type: :feature do

    before(:each) do
       User.create(email: "testadmin@admin.com", password: "qwerty",
      password_confirmation: "qwerty", nickname: "testadmin", admin: true)
        Category.create(name: "Nature")
     end

  it 'should add new article to database' do
    expect do
     Article.create(
       title: Faker::Lorem.words(number: 3),
       content: Faker::Lorem.paragraphs(number: 6),
       category_id: 1,
       user_id: 1,
       published_at: "2023-10-12 09:16:00"
     )
    end.to change { Article.count }.by(1)
  end

  it 'should NOT add new article to database' do
    expect do
     Article.create(
       title: Faker::Lorem.words(number: 3),
       content: Faker::Lorem.words(number: 5),
       category_id: 1,
       user_id: 1,
       published_at: "2023-10-12 12:16:00"
     )
   end.to change { Article.count }.by(0)
  end

end

describe 'article creating', type: :feature do
  it 'should add new article to database' do
    expect do
      Category.create(name: "Nature")
    end.to change { Category.count }.by(1)
  end

  it 'should NOT add new article to database' do
    expect do
      Category.create(name: "Na")
    end.to change { Category.count }.by(0)
  end

end
