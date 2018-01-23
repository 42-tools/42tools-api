require 'test_helper'

class V1::AppsTokensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @apps_token = apps_tokens(:one)
  end

  test 'should get index' do
    get v1_apps_tokens_url, as: :json
    assert_response :success
  end

  test 'should show token' do
    get v1_apps_token_url(@apps_token), as: :json
    assert_response :success
  end
end
