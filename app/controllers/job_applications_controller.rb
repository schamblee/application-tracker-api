class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: [:show, :update, :destroy]

  def index
    @job_applications = JobApplication.all
    render json: @job_applications
  end

  def show
    render json: @job_application
  end

  def create
    @job_application = JobApplication.new(job_application_params)

    if @job_application.save
      render json: @job_application, status: :created
    else
      render json: @job_application.errors, status: :unprocessable_entity
    end
  end

  def update
    if @job_application.update(job_application_params)
      render json: @job_application
    else
      render json: @job_application.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @job_application.destroy
    head :no_content
  end

  private

  def set_job_application
    @job_application = JobApplication.find(params[:id])
  end

  def job_application_params
    params.expect(job_application: [:company, :title, :job_posting_url, :referrer_name, :application_status, :submission_date])
  end
end
