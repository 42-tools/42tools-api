require 'test_helper'

class V1::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'should get index' do
    get v1_users_url, as: :json
    assert_response :success
  end

  test 'should show user' do
    get v1_user_url(@user), as: :json
    assert_response :success
  end
end
