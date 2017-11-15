require 'test_helper'

class V1::GroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group = groups(:one)
  end

  test 'should get index' do
    get v1_groups_url, as: :json
    assert_response :success
  end

  test 'should show group' do
    get v1_group_url(@group), as: :json
    assert_response :success
  end
end
