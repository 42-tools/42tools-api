require 'test_helper'

class V1::ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test 'should get index' do
    get v1_projects_url, as: :json
    assert_response :success
  end

  test 'should show project' do
    get v1_project_url(@project), as: :json
    assert_response :success
  end
end
