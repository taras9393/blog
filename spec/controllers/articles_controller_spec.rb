require 'rails_helper'

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
