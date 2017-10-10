require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group = groups(:one)
  end

  test "should get index" do
    get groups_url, as: :json
    assert_response :success
  end

  test "should show group" do
    get group_url(@group), as: :json
    assert_response :success
  end
end
