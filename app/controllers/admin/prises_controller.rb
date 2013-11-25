# encoding: utf-8
class Admin::PrisesController < AdminController
  before_action :set_prise, only: [:show, :edit, :update, :destroy]

  # GET /prises
  # GET /prises.json
  def index
    @prises = Prise.all.page( params[ :page ] )
  end

  # GET /prises/new
  def new
    @prise = Prise.new
    @honoree = @prise.honorees.build
    
    #@prise.title = "#{Time.now.year}年#{Time.now.month}月份員工表揚"
    
  end

  # GET /prises/1/edit
  def edit
  	@honoree = @prise.honorees.build
  end

  # POST /prises
  # POST /prises.json
  def create
    @prise = Prise.new(prise_params)
    @honoree = @prise.honorees.build( honor_params )
    @honoree.delete if nil_honoree(@honoree)
    
    respond_to do |format|
      if @prise.save && ( !@honoree.nil? && @honoree.save )
        format.html { redirect_to edit_admin_prise_path(@prise), notice: 'Prise was successfully created.' }
        format.json { render action: 'show', status: :created, location: @prise }
      else
      	flash[ :warning ] = @prise.errors.full_messages.join( '<br>' )
      	flash[ :warning ] += (@honoree.errors.full_messages.join( '<br>' ) ) if !@honoree.nil?
      	
        format.html { render action: 'new' }
        format.json { render json: @prise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prises/1
  # PATCH/PUT /prises/1.json
  def update
    @honoree = @prise.honorees.build( honor_params )
    
    
    @honoree.delete if nil_honoree(@honoree)
    
    respond_to do |format|
      if @prise.update(prise_params) && ( !@honoree.valid? ^ @honoree.save )
        format.html { redirect_to edit_admin_prise_path(@prise), notice: 'Prise was successfully updated.' }
        format.json { head :no_content }
      else
      	flash[ :warning ] = @prise.errors.full_messages.join( '<br>' )
      	flash[ :warning ] += (@honoree.errors.full_messages.join( '<br>' ) ) if !@honoree.nil?
      	
        format.html { render action: 'edit' }
        format.json { render json: @prise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prises/1
  # DELETE /prises/1.json
  def destroy
    @prise.destroy
    respond_to do |format|
      format.html { redirect_to admin_prises_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prise
      @prise = Prise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prise_params    	
      params.require(:prise).permit(:title, :month, :status)
    end
    
    def honor_params
      return if params[ :honoree ].nil?
      params.require(:honoree).permit(:name, :cover, :content, :area)
    end
    
    def nil_honoree( honoree )
    	return (honoree.name.nil? && honoree.cover.nil? && honoree.content.nil? && honoree.area.nil?) || (honoree.name.length <= 0 && honoree.content.length <= 0 && honoree.area.length <= 0)
    end
end
