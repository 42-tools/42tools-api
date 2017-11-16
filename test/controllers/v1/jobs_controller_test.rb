require 'test_helper'

class V1::JobsControllerTest < ActionDispatch::IntegrationTest
  # setup do
  #   @job = jobs(:one)
  # end

  test "should get index" do
    get v1_jobs_url, as: :json
    assert_response :success
  end

  # test "should show job" do
  #   get v1_job_url(@job), as: :json
  #   assert_response :success
  # end

  # test "should destroy job" do
  #   assert_difference('Job.count', -1) do
  #     delete v1_job_url(@job), as: :json
  #   end
  #
  #   assert_response 204
  # end
end
