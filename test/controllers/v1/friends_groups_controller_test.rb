require 'test_helper'

class V1::FriendsGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friends_group = friends_groups(:one)
  end

  test 'should get index' do
    get v1_friends_groups_url, as: :json
    assert_response :success
  end

  test 'should create friends_group' do
    assert_difference('FriendsGroup.count') do
      post v1_friends_groups_url, params: { name: @friends_group.name }, as: :json
    end

    assert_response 201
  end

  test 'should show friends_group' do
    get v1_friends_group_url(@friends_group), as: :json
    assert_response :success
  end

  test 'should update friends_group' do
    patch v1_friends_group_url(@friends_group), params: { name: @friends_group.name }, as: :json
    assert_response 200
  end

  test 'should destroy friends_group' do
    assert_difference('FriendsGroup.count', -1) do
      delete v1_friends_group_url(@friends_group), as: :json
    end

    assert_response 204
  end
end
