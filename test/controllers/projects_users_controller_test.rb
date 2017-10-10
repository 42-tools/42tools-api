require 'test_helper'

class ProjectsUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @projects_user = projects_users(:one)
  end

  test "should get index" do
    get projects_users_url, as: :json
    assert_response :success
  end

  test "should show projects_user" do
    get projects_user_url(@projects_user), as: :json
    assert_response :success
  end
end
