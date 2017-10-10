require 'test_helper'

class CampusUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campus_user = campus_users(:one)
  end

  test "should get index" do
    get campus_users_url, as: :json
    assert_response :success
  end

  test "should show campus_user" do
    get campus_user_url(@campus_user), as: :json
    assert_response :success
  end
end
