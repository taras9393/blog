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
                                                              #ArticleModelArticleModel
describe Article, type: :model do

  it { should belong_to(:user) }
  it { should belong_to(:category) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:user_id) }
#  it { should validate_presence_of(:category_id) }

  it { should validate_uniqueness_of(:title).case_insensitive }

end

                                                              #CategoryModelCategoryModel
  describe Category, type: :model do
   it { should have_many(:articles) }
   it { should validate_presence_of(:name) }
  end

                                                                    #UserController#UserController
describe UsersController, type: :controller do
 it { should use_before_action(:authenticate_user!) }
end

                                                                      #FeatureFeature
 describe 'succesfull user creating', type: :feature do
   it 'should add new user to database' do
     u1 = User.all.count
     visit new_user_registration_path
     fill_in 'Nickname', with: 'asdfgh'
     fill_in 'Email', with: 'asdfgh@example.com'
     fill_in 'Password', with: 'qwerty'
     fill_in 'Password confirmation', with: 'qwerty'
     click_button 'Sign up'
     u2 = User.all.count
     expect(u2 - u1).to eq(1)
   end
 end

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

  describe 'getting all user list', type: :feature do
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

                                                              #ArticleControllerArticleController
   describe ArticlesController, type: :controller do
    context "GET index" do
     it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
     end
    end
  end

  describe ArticlesController, type: :controller do
   it { should use_before_action(:authenticate_user!) }
  end

                                                          #RoutesRoutes
  describe ArticlesController, type: :routing do
  it "routes a named route" do
    expect(:get => new_article_path).
      to route_to(:controller => "articles", :action => "new")
  end

  it "routes a named route" do
    expect(:get => articles_path).
      to route_to(:controller => "articles", :action => "index")
  end

  it "routes a named route" do
    expect(:get => profile_path).
      to route_to(:controller => "users", :action => "profile")
  end

  it { should route(:get, '/articles/1').to(action: :show, id: 1) }

end
