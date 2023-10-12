require 'rails_helper'

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
