require 'test_helper'

class Oauth::AuthorizeControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get oauth_authorize_show_url
    assert_response :success
  end

end
