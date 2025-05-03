class JobApplication < ApplicationRecord
  validates :title, :company, :application_status, presence: true
  validates :title, uniqueness: {scope: :company, message: :already_exists_for_company}
  validates :job_posting_url, presence: true, format: {with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: :invalid_url}

  enum :application_status, {
    applied: 0,
    interviewing: 1,
    offer: 2,
    rejected: 3,
    closed: 4
  }
end
