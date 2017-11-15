require 'test_helper'

class V1::FriendsUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friends_user = friends_users(:one)
  end

  test 'should get index' do
    get v1_friends_users_url, as: :json
    assert_response :success
  end

  test 'should create friends_user' do
    assert_difference('FriendsUser.count') do
      post v1_friends_users_url, params: { user_id: @friends_user.friend_id }, as: :json
    end

    assert_response 201
  end

  test 'should show friends_user' do
    get v1_friends_user_url(@friends_user), as: :json
    assert_response :success
  end

  test 'should destroy friends_user' do
    assert_difference('FriendsUser.count', -1) do
      delete v1_friends_user_url(@friends_user), as: :json
    end

    assert_response 204
  end
end
