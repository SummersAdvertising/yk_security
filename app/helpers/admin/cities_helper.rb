module Admin::CitiesHelper
  def fetch_city_name(looking_for)
    city = City.where(id: looking_for).first
    unless city.blank?
      city.name
    else
      "unknown"
    end
  end  
end