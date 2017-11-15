require 'test_helper'

class V1::ProjectsUsersCursusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @projects_users_cursus = projects_users_cursus(:one)
  end

  test 'should get index' do
    get v1_projects_users_cursus_index_url, as: :json
    assert_response :success
  end

  test 'should show projects_users_cursus' do
    get v1_projects_users_cursu_url(@projects_users_cursus), as: :json
    assert_response :success
  end
end
