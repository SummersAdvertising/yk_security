#encoding: utf-8
class Admin::MinistoragesController < AdminController
  
  before_action :set_ministorage, only: [:show, :edit, :update, :intro, :update_intro, :destroy]

  def index
    @ministorages = Ministorage.page(params[:page])
  end

  def new
    @ministorage = Ministorage.new

    @countries = Country.all #use it when country selectable
    @cities = City.where("country_id = ?", Country.first.id)
    @districts = District.where("city_id = ?", City.first.id)

  end
    
  def create

    @ministorage = Ministorage.new(ministorage_params)
    @ministorage.article = Article.new    
    
    respond_to do |format|
      if @ministorage.save
        format.html { redirect_to admin_ministorages_path(), notice: 'ministorage was successfully created.' }
      else
        format.html { redirect_to :back, notice: @ministorage.errors.full_messages }
      end
    end

  end

  def show
    #.pluck(:name, :lat, :lng).to_json
    # nearby_info = Ministorage.within(5, origin: @ministorage)
    # @info_array = Array.new
    # nearby_info.each do |ministorage|
      
    #   if ministorage.galleries.select{ |v| v['type'] == "MinistoragePhotoGallery"  }.first
    #     a = ministorage.galleries.select{ |v| v['type'] == "MinistoragePhotoGallery"  }.first.attachment.url 
    #   end

    #   temp = [render_to_string(partial: 'info_window', :layout => false, locals: {ministorage: ministorage})]
    #   @info_array.push(temp)
    # end 
    
  end

  # GET /admin/ministorages/1/edit
  def edit
    
    @cities = City.where("country_id = ?", @ministorage.country)
    @districts = District.where("city_id = ?", @ministorage.city)

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


  # PATCH/PUT /admin/ministorages/1
  # PATCH/PUT /admin/ministorages/1.json
  def update

    respond_to do |format|
      if @ministorage.update(ministorage_params)
        format.html { redirect_to :back, notice: '更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: :back }
        format.json { render json: @ministorage.errors, status: :unprocessable_entity }
      end
    end
  end

  def intro
    @cities = City.where("country_id = ?", @ministorage.country)
    @districts = District.where("city_id = ?", @ministorage.city)
  end

  def update_intro
    respond_to do |format|
      if @ministorage.update(ministorage_params) && ( params[ :article ].nil? ^ @ministorage.article.update( params.require(:article).permit(:content) ) )
        format.html { redirect_to intro_admin_ministorage_path(@ministorage), notice: 'Ministorage was successfully updated.' }
        format.js
        format.json { head :no_content }
      else
        flash[ :warning ] = @ministorage.errors.full_messages.join( '<br>' )
        format.html { render action: 'intro' }
        format.json { render json: @ministorage.errors, status: :unprocessable_entity }
      end
    end

  end
  # DELETE /admin/ministorages/1
  # DELETE /admin/ministorages/1.json
  def destroy

    @ministorage.destroy
    respond_to do |format|
      format.html { redirect_to admin_ministorages_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ministorage
    #@ministorage = Ministorage.friendly.find(params[:id])
    @ministorage = Ministorage.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ministorage_params
    params.require(:ministorage).permit(:content,:name, :address, :intro, :phone, :country, :city, :district, :map_iframe  )
  end

end