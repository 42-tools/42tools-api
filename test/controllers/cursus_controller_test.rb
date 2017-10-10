require 'test_helper'

class CursusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cursus = cursus(:one)
  end

  test "should get index" do
    get cursus_index_url, as: :json
    assert_response :success
  end

  test "should show cursus" do
    get cursu_url(@cursus), as: :json
    assert_response :success
  end
end
