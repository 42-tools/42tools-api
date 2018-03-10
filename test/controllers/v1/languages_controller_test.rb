require 'test_helper'

class V1::LanguagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @language = languages(:one)
  end

  test 'should get index' do
    get v1_languages_index_url, as: :json
    assert_response :success
  end

  test 'should show campus' do
    get v1_languages_url(@language), as: :json
    assert_response :success
  end
end
