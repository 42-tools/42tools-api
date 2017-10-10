require 'test_helper'

class CursusUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cursus_user = cursus_users(:one)
  end

  test "should get index" do
    get cursus_users_url, as: :json
    assert_response :success
  end

  test "should show cursus_user" do
    get cursus_user_url(@cursus_user), as: :json
    assert_response :success
  end
end
