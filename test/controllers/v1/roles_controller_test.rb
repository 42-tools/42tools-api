require 'test_helper'

class FortyTwo::RolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @role = roles(:one)
  end

  test "should get index" do
    get v1_roles_url, as: :json
    assert_response :success
  end

  test "should show forty_two_role" do
    get v1_roles_url(@role), as: :json
    assert_response :success
  end
end
