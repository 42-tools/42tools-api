require 'test_helper'

class V1::AppsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app = apps(:one)
  end

  test 'should get index' do
    get v1_apps_url, as: :json
    assert_response :success
  end

  test 'should show app' do
    get v1_app_url(@app), as: :json
    assert_response :success
  end
end
