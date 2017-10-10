require 'test_helper'

class FriendsGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friends_group = friends_groups(:one)
  end

  test "should get index" do
    get friends_groups_url, as: :json
    assert_response :success
  end

  test "should create friends_group" do
    assert_difference('FriendsGroup.count') do
      post friends_groups_url, params: { friends_group: { name: @friends_group.name, owner_id: @friends_group.owner_id } }, as: :json
    end

    assert_response 201
  end

  test "should show friends_group" do
    get friends_group_url(@friends_group), as: :json
    assert_response :success
  end

  test "should update friends_group" do
    patch friends_group_url(@friends_group), params: { friends_group: { name: @friends_group.name, owner_id: @friends_group.owner_id } }, as: :json
    assert_response 200
  end

  test "should destroy friends_group" do
    assert_difference('FriendsGroup.count', -1) do
      delete friends_group_url(@friends_group), as: :json
    end

    assert_response 204
  end
end
