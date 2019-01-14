require 'test_helper'

class Api::ScoresControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_scores_create_url
    assert_response :success
  end

end
