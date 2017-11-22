require 'test_helper'

class V1::CoalitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coalition = coalitions(:one)
  end

  test 'should get index' do
    get v1_coalitions_url, as: :json
    assert_response :success
  end

  test 'should show coalition' do
    get v1_coalition_url(@coalition), as: :json
    assert_response :success
  end
end
