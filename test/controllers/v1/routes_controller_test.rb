require 'test_helper'

class V1::RoutesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get v1_routes_index_url
    assert_response :success
  end

end
