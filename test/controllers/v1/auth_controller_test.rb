require 'test_helper'

class V1::AuthControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get v1_auth_create_url
    assert_response :success
  end
end
