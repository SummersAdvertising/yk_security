# encoding: utf-8
class Admin::ServicesController < AdminController
 
  before_action :set_service, only: [:show, :edit, :update, :destroy, :external, :regular]

  def external
  	@service.update_attribute('service_type', 'external')
  	
  	flash[ :notice ] = "服務項目已經轉換為外部連結型態。"
  	
  	respond_to do | format |
  		format.html{ redirect_to :action => :edit }
  	end
  end
  
  def regular
  	@service.update_attribute('service_type', 'regular')
  	
  	flash[ :notice ] = "服務項目已經轉換為文章編輯型態。"
  	
  	respond_to do | format |
  		format.html{ redirect_to :action => :edit }
  	end
  end

  def index
  	@services = Service.all
  	@regular_services = Service.where( 'service_type <> "external"' )
  	@external_services = Service.where( :service_type => 'external' )
  end

  # GET /admin/service/1
  # GET /admin/service/1.json
  def show
  	respond_to do | format |
    	if @service.service_type != 'external'
	        format.html 
	    else
	    	format.html{ render template: 'admin/services/show_external' }
	    end
  	end
  end

  # GET /admin/service/new
  def create
  	
    @service = Service.new
    @service.article = Article.new
    @service.title = "未命名標題"
    
    respond_to do |format|
    	if @service.save
	        format.html { redirect_to edit_admin_service_path(@service), notice: '新服務項目已建立.' }
	        format.json { render action: 'show', status: :created, location: @service }
        end
    end
  end

  # GET /admin/service/1/edit
  def edit
  	@service.items = @service.items || []

    respond_to do |format|
    	if @service.service_type != 'external'
	        format.html 
	    else
	    	format.html{ render template: 'admin/services/edit_external' }
	    end
    end
  end

  # PATCH/PUT /admin/service/1
  # PATCH/PUT /admin/service/1.json
  def update
  	
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to admin_service_path(@service), notice: 'Service was successfully updated.' }
        format.js
        format.json { head :no_content }
      else
      	flash[ :warning ] = @service.errors.full_messages.join( '<br>' )
        format.html { render action: 'edit' }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/service/1
  # DELETE /admin/service/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to admin_services_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      atts = params.require(:service).permit(:title, {:items => []},:cover, :content, :external_link, :status, {:article_attributes => [ :content ]}, :id )
      atts['items'] = atts['items'].reject { | i | i.length <= 0 }
      
      atts
      
    end

end