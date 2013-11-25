json.array!(@recruits) do |recruit|
  json.extract! recruit, :name, :notice_id, :sex, :birthday, :phone, :address, :email, :educated, :experience, :brief, :status, :checked
  json.url recruit_url(recruit, format: :json)
end
