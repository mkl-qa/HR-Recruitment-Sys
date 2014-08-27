json.array!(@jobapps) do |jobapp|
  json.extract! jobapp, :id, :title, :dept, :num, :description, :requirement
  json.url jobapp_url(jobapp, format: :json)
end
