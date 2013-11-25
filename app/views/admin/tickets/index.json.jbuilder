json.array!(@tickets) do |ticket|
  json.extract! ticket, :name, :company, :phone, :mobile, :address, :email, :services, :status
  json.url ticket_url(ticket, format: :json)
end
