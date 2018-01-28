require 'test_helper'

class Oauth::CallbacksControllerTest < ActionDispatch::IntegrationTest
  test 'should show callback' do
    get oauth_callback_url, as: :json
    assert_response :success
  end
end
