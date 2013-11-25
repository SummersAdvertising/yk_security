json.array!(@prises) do |prise|
  json.extract! prise, :title, :month, :status
  json.url prise_url(prise, format: :json)
end
