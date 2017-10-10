require 'test_helper'

class GroupsUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @groups_user = groups_users(:one)
  end

  test "should get index" do
    get groups_users_url, as: :json
    assert_response :success
  end

  test "should show groups_user" do
    get groups_user_url(@groups_user), as: :json
    assert_response :success
  end
end
