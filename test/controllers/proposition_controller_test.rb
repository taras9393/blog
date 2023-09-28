require 'test_helper'

class PropositionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get proposition_new_url
    assert_response :success
  end

  test "should get destroy" do
    get proposition_destroy_url
    assert_response :success
  end

end
