FactoryBot.define do
  factory :job_application do
    company { "Example Corp" }
    title { "Developer" }
    job_posting_url { "https://example.com/job" }
    referrer_name { "Jane Doe" }
    application_status { :applied }
    submission_date { Time.zone.today }
  end
end
