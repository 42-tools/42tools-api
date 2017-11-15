require 'test_helper'

class V1::FriendsGroupsUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friends_groups_user = friends_groups_users(:one)
  end

  test 'should get index' do
    get v1_friends_group_friends_url, as: :json
    assert_response :success
  end

  test 'should create friends_groups_user' do
    assert_difference('FriendsGroupsUser.count') do
      post v1_friends_group_friends_url(@friends_groups_user.friends_group_id), params: { user_id: @friends_groups_user.friends_user_id }, as: :json
    end

    assert_response 201
  end

  test 'should show friends_groups_user' do
    get v1_friends_group_friend_url(@friends_groups_user.friends_group_id, @friends_groups_user.friends_user_id), as: :json
    assert_response :success
  end

  test 'should destroy friends_groups_user' do
    assert_difference('FriendsGroupsUser.count', -1) do
      delete v1_friends_group_friend_url(@friends_groups_user.friends_group_id, @friends_groups_user.friends_user_id), as: :json
    end

    assert_response 204
  end
end
