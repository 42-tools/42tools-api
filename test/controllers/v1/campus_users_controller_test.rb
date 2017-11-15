require 'test_helper'

class V1::CampusUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campus_user = campus_users(:one)
  end

  test 'should get index' do
    get v1_campus_users_url, as: :json
    assert_response :success
  end

  test 'should show campus_user' do
    get v1_campus_user_url(@campus_user), as: :json
    assert_response :success
  end
end
