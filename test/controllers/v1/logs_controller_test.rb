require 'test_helper'

class V1::LogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @log = logs(:one)
  end

  test 'should get index' do
    get v1_logs_url, as: :json
    assert_response :success
  end

  test 'should show log' do
    get v1_log_url(@log), as: :json
    assert_response :success
  end
end
