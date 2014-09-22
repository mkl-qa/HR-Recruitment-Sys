json.array!(@requisitions) do |requisition|
  json.extract! requisition, :id,:Req_ID, :Req_NO, :Position_title, :priority, :job_category, :OG, :Position_Level, :Location, :Openings, :Account_information, :hiring_mgr, :job_posting_date
  json.url requisition_url(requisition, format: :json)
end
