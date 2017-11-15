require 'test_helper'

class V1::CampusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campus = campus(:one)
  end

  test 'should get index' do
    get v1_campus_index_url, as: :json
    assert_response :success
  end

  test 'should show campus' do
    get v1_campu_url(@campus), as: :json
    assert_response :success
  end
end
