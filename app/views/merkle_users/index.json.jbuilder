json.array!(@merkle_users) do |merkle_user|
  json.extract! merkle_user, :id, :user_name, :user_psd, :eng_name, :chn_name, :email, :bu, :location, :mgr, :position_title, :user_role
  json.url merkle_user_url(merkle_user, format: :json)
end
