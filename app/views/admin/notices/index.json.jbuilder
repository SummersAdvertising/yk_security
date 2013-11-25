json.array!(@notices) do |notice|
  json.extract! notice, :title, :area, :content, :compensation, :job_type, :shift, :holiday, :experience, :educated, :comment, :contact_name, :contact_phone, :contact_address, :contact_email, :notice_type, :status
  json.url notice_url(notice, format: :json)
end
