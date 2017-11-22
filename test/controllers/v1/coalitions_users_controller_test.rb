require 'test_helper'

class V1::CoalitionsUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coalitions_user = coalitions_users(:one)
  end

  test 'should get index' do
    get v1_coalitions_users_url, as: :json
    assert_response :success
  end

  test 'should show coalitions_user' do
    get v1_coalitions_user_url(@coalitions_user), as: :json
    assert_response :success
  end
end
