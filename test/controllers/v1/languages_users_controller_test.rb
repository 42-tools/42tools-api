require 'test_helper'

class V1::LanguagesUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @languages_user = languages_users(:one)
  end

  test 'should get index' do
    get v1_languages_users_index_url, as: :json
    assert_response :success
  end

  test 'should show languages user' do
    get v1_languages_users_url(@languages_user), as: :json
    assert_response :success
  end
end
