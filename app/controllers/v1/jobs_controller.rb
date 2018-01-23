class V1::JobsController < ApplicationController
  before_action :require_app_admin!
  before_action :set_job, only: %i(show update destroy)

  # GET /jobs
  def index
    @jobs = paginate(Delayed::Job.all)
  end

  # GET /jobs/1
  def show
  end

  # PATCH/PUT /jobs/1
  def update
    if @job.failed_at
      if @job.update(run_at: Time.current, failed_at: nil, last_error: nil)
        render :show
      else
        render json: @job.errors, status: :unprocessable_entity
      end
    else
      render json: {
        error: 'job is running'
      }, status: :unprocessable_entity
    end
  end

  # DELETE /jobs/1
  def destroy
    if @job.failed_at
      @job.destroy
    else
      render json: {
        error: 'job is running'
      }, status: :unprocessable_entity
    end
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_job
    @job = Delayed::Job.find(params[:id])
  end
end
