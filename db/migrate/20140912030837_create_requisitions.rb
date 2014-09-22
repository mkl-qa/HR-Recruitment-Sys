class CreateRequisitions < ActiveRecord::Migration
  def change
    create_table :requisitions do |t|
      t.string :Req_ID
      t.string :Req_NO
      t.string :Position_title
      t.string :priority
      t.string :job_category
      t.string :OG
      t.string :Position_Level
      t.string :Location
      t.integer :Openings
      t.string :Account_information
      t.string :hiring_mgr
      t.date :job_posting_date
      t.string :approved_in_RMO_or_Not
      t.date :RMO_Open_Date
      t.date :preferred_onboard_date
      t.string :Biz_impact_details
      t.string :key_words
      t.string :cahnnel
      t.string :status
      t.string :open_to_candidate
      t.string :job_description
      t.string :desired_skills_and_experience

      t.timestamps
    end
  end
end
