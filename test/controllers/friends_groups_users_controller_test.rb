require 'test_helper'

class FriendsGroupsUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friends_groups_user = friends_groups_users(:one)
  end

  test "should get index" do
    get friends_groups_users_url, as: :json
    assert_response :success
  end

  test "should create friends_groups_user" do
    assert_difference('FriendsGroupsUser.count') do
      post friends_groups_users_url, params: { friends_groups_user: { friends_group_id: @friends_groups_user.friends_group_id, friends_user_id: @friends_groups_user.friends_user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show friends_groups_user" do
    get friends_groups_user_url(@friends_groups_user), as: :json
    assert_response :success
  end

  test "should destroy friends_groups_user" do
    assert_difference('FriendsGroupsUser.count', -1) do
      delete friends_groups_user_url(@friends_groups_user), as: :json
    end

    assert_response 204
  end
end
