#encoding: utf-8
class Admin::BabahomesController < AdminController
  
  before_action :set_babahome, only: [:show, :edit, :update, :intro, :update_intro, :destroy]

  def index
    @babahomes = Babahome.page(params[:page])
  end

  def new
    @babahome = Babahome.new

    @countries = Country.all #use it when country selectable
    @cities = City.where("country_id = ?", Country.first.id)
    @districts = District.where("city_id = ?", City.first.id)

  end
    
  def create

    @babahome = Babahome.new(babahome_params)
    @babahome.article = Article.new    
    
    respond_to do |format|
      if @babahome.save
        format.html { redirect_to admin_babahomes_path(), notice: 'babahome was successfully created.' }
      else
        format.html { redirect_to :back, notice: @babahome.errors.full_messages }
      end
    end

  end

  def show
    #.pluck(:name, :lat, :lng).to_json
    # nearby_info = Babahome.within(5, origin: @babahome)
    # @info_array = Array.new
    # nearby_info.each do |babahome|
      
    #   if babahome.galleries.select{ |v| v['type'] == "BabahomePhotoGallery"  }.first
    #     a = babahome.galleries.select{ |v| v['type'] == "BabahomePhotoGallery"  }.first.attachment.url 
    #   end

    #   temp = [render_to_string(partial: 'info_window', :layout => false, locals: {babahome: babahome})]
    #   @info_array.push(temp)
    # end 
    
  end

  # GET /admin/babahomes/1/edit
  def edit
    
    @cities = City.where("country_id = ?", @babahome.country)
    @districts = District.where("city_id = ?", @babahome.city)

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


  # PATCH/PUT /admin/babahomes/1
  # PATCH/PUT /admin/babahomes/1.json
  def update

    respond_to do |format|
      if @babahome.update(babahome_params)
        format.html { redirect_to :back, notice: '更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: :back }
        format.json { render json: @babahome.errors, status: :unprocessable_entity }
      end
    end
  end

  def intro
    @cities = City.where("country_id = ?", @babahome.country)
    @districts = District.where("city_id = ?", @babahome.city)
  end

  def update_intro
    respond_to do |format|
      if @babahome.update(babahome_params) && ( params[ :article ].nil? ^ @babahome.article.update( params.require(:article).permit(:content) ) )
        format.html { redirect_to intro_admin_babahome_path(@babahome), notice: 'Babahome was successfully updated.' }
        format.js
        format.json { head :no_content }
      else
        flash[ :warning ] = @babahome.errors.full_messages.join( '<br>' )
        format.html { render action: 'intro' }
        format.json { render json: @babahome.errors, status: :unprocessable_entity }
      end
    end

  end
  # DELETE /admin/babahomes/1
  # DELETE /admin/babahomes/1.json
  def destroy

    @babahome.destroy
    respond_to do |format|
      format.html { redirect_to admin_babahomes_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_babahome
    #@babahome = Babahome.friendly.find(params[:id])
    @babahome = Babahome.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def babahome_params
    params.require(:babahome).permit(:content,:name, :address, :intro, :phone, :country, :city, :district, :map_iframe  )
  end

end