require 'test_helper'

class V1::AchievementsUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @achievements_user = achievements_users(:one)
  end

  test 'should get index' do
    get v1_achievements_users_url, as: :json
    assert_response :success
  end

  test 'should show achievements_user' do
    get v1_achievements_user_url(@achievements_user), as: :json
    assert_response :success
  end
end
