require 'test_helper'

class V1::TitlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @title = titles(:one)
  end

  test 'should get index' do
    get v1_titles_url, as: :json
    assert_response :success
  end

  test 'should show title' do
    get v1_title_url(@title), as: :json
    assert_response :success
  end
end
