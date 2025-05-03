class CreateJobApplications < ActiveRecord::Migration[8.0]
  def change
    create_table :job_applications do |t|
      t.string :company, null: false
      t.string :title, null: false
      t.string :job_posting_url, null: false
      t.string :referrer_name
      t.integer :application_status, default: 0, null: false
      t.date :submission_date, null: false

      t.timestamps
    end

    add_index :job_applications, [:company, :title], unique: true
  end
end
