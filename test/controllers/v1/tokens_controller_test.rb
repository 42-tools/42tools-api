require 'test_helper'

class V1::TokensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @token = tokens(:one)
  end

  test 'should get index' do
    get v1_tokens_url, as: :json
    assert_response :success
  end

  test 'should show token' do
    get v1_token_url(@token), as: :json
    assert_response :success
  end
end
