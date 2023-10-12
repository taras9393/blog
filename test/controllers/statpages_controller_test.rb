require 'test_helper'

class StatpagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get statpages_home_url
    assert_response :success
  end

end
