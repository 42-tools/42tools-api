require 'test_helper'

class V1::CursusUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cursus_user = cursus_users(:one)
  end

  test 'should get index' do
    get v1_cursus_users_url, as: :json
    assert_response :success
  end

  test 'should show cursus_user' do
    get v1_cursus_user_url(@cursus_user), as: :json
    assert_response :success
  end
end
