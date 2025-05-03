require "test_helper"

class JobApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_application = create(:job_application)
  end

  test "should get index" do
    get job_applications_url
    assert_response :success
  end

  test "should show job application" do
    get job_application_url(@job_application)
    assert_response :success
  end

  test "should create job application" do
    assert_difference("JobApplication.count") do
      post job_applications_url, params: {
        job_application: {
          company: "NewCo",
          title: "Engineer",
          job_posting_url: "https://newco.com/job",
          referrer_name: "Sam Smith",
          application_status: "applied",
          submission_date: Time.zone.today
        }
      }
    end

    assert_response :created
  end

  test "should update job application" do
    patch job_application_url(@job_application), params: {
      job_application: {application_status: "interviewing"}
    }
    assert_response :success
    assert_equal "interviewing", @job_application.reload.application_status
  end

  test "should destroy job application" do
    assert_difference("JobApplication.count", -1) do
      delete job_application_url(@job_application)
    end
    assert_response :no_content
  end
end
