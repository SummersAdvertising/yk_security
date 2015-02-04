#encoding: utf-8
class MinistoragesController < ApplicationController
  
  before_action :set_ministorage, only: [:show]

  def index
    all_ministorage_cities = Ministorage.pluck(:city)
    
    @countries = Country.all #use it when country selectable
    @cities = City.where(id: all_ministorage_cities )
    @districts = District.where("city_id = ?", all_ministorage_cities.first)

    @q = Ministorage.search(params[:q])
  end

  def search
    
    @q = Ministorage.search(params[:q])
    @ministorages = @q.result(distinct: true)

    if @ministorages.count <= 0
      
      if params[:q]['city_eq']
         target_city = City.where(id: params[:q]['city_eq'].to_i).limit(1).pluck(:name)
         @target_city_name = target_city[0] if target_city
      end

      if params[:q]['district_eq']
        target_district = District.where(id: params[:q]['district_eq'].to_i).limit(1).pluck(:name)
        @target_district_name = target_district[0] if target_district
      end

    end

    respond_to do |format|
      format.js
    end    
    
  end

  def fetch_from_country
    @cities = City.where("country_id = ?", params[:country_id])
    @districts = District.where("city_id = ?", @cities.first.id)
    respond_to do |format|
      format.js
    end    
  end

  def fetch_from_city 
    
    @districts = District.where("city_id = ?", params[:city_id])
    respond_to do |format|
      format.js
    end    
  end

  def show
    
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ministorage
    @ministorage = Ministorage.find(params[:id])
  end

end