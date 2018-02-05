require 'test_helper'

class V1::TitlesUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @titles_user = titles_users(:one)
  end

  test 'should get index' do
    get v1_titles_users_url, as: :json
    assert_response :success
  end

  test 'should show titles_user' do
    get v1_titles_user_url(@titles_user), as: :json
    assert_response :success
  end
end
