require 'test_helper'

class V1::CursusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cursus = cursus(:one)
  end

  test 'should get index' do
    get v1_cursus_index_url, as: :json
    assert_response :success
  end

  test 'should show cursus' do
    get v1_cursu_url(@cursus), as: :json
    assert_response :success
  end
end
