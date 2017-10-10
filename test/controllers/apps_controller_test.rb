require 'test_helper'

class AppsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app = apps(:one)
  end

  test "should get index" do
    get apps_url, as: :json
    assert_response :success
  end

  test "should show app" do
    get app_url(@app), as: :json
    assert_response :success
  end
end
