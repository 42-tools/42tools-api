require 'test_helper'

class FriendsUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friends_user = friends_users(:one)
  end

  test "should get index" do
    get friends_users_url, as: :json
    assert_response :success
  end

  test "should create friends_user" do
    assert_difference('FriendsUser.count') do
      post friends_users_url, params: { friends_user: { friend_id: @friends_user.friend_id, owner_id: @friends_user.owner_id } }, as: :json
    end

    assert_response 201
  end

  test "should show friends_user" do
    get friends_user_url(@friends_user), as: :json
    assert_response :success
  end

  test "should destroy friends_user" do
    assert_difference('FriendsUser.count', -1) do
      delete friends_user_url(@friends_user), as: :json
    end

    assert_response 204
  end
end
