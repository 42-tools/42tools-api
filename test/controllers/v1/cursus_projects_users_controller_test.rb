require 'test_helper'

class V1::CursusProjectsUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cursus_projects_user = cursus_projects_users(:one)
  end

  test 'should get index' do
    get v1_cursus_projects_users_index_url, as: :json
    assert_response :success
  end

  test 'should show cursus_projects_user' do
    get v1_cursus_projects_users_url(@cursus_projects_user), as: :json
    assert_response :success
  end
end
