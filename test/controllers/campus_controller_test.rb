require 'test_helper'

class CampusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campus = campus(:one)
  end

  test "should get index" do
    get campus_index_url, as: :json
    assert_response :success
  end

  test "should show campus" do
    get campu_url(@campus), as: :json
    assert_response :success
  end
end
