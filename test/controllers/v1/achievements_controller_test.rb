require 'test_helper'

class V1::AchievementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @achievement = achievements(:one)
  end

  test 'should get index' do
    get v1_achievements_url, as: :json
    assert_response :success
  end

  test 'should show achievement' do
    get v1_achievement_url(@achievement), as: :json
    assert_response :success
  end
end
