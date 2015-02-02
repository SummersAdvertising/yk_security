#encoding: utf-8
class Admin::IntroPagesController < AdminController
  
  before_action :set_intro_page, only: [:show, :edit, :update, :destroy]

  def index
    @intro_pages = IntroPage.page(params[:page])
    
    redirect_to admin_intro_page_path(IntroPage.last)
  end

  def new
    @intro_page = IntroPage.new
  end
    
  def create

    @intro_page = IntroPage.new(intro_page_params)
    # @intro_page.article = Article.new    
    
    respond_to do |format|
      if @intro_page.save
        format.html { redirect_to admin_intro_pages_path(), notice: 'intro_page was successfully created.' }
      else
        format.html { redirect_to :back, notice: @intro_page.errors.full_messages }
      end
    end

  end

  def show

  end

  # GET /admin/intro_pages/1/edit
  def edit

  end

  # PATCH/PUT /admin/intro_pages/1
  # PATCH/PUT /admin/intro_pages/1.json
  def update

    respond_to do |format|
      if @intro_page.update(intro_page_params) && ( params[ :article ].nil? ^ @intro_page.article.update( params.require(:article).permit(:content) ) )
        format.html { redirect_to admin_intro_page_path(@intro_page), notice: 'Successfully updated.' }
        format.js
        format.json { head :no_content }
      else
        flash[ :warning ] = @intro_page.errors.full_messages.join( '<br>' )
        format.html { render action: 'edit' }
        format.json { render json: @intro_page.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /admin/intro_pages/1
  # DELETE /admin/intro_pages/1.json
  def destroy

    @intro_page.destroy
    respond_to do |format|
      format.html { redirect_to admin_intro_pages_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_intro_page
    #@intro_page = IntroPage.friendly.find(params[:id])
    @intro_page = IntroPage.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def intro_page_params
    params.require(:intro_page).permit(:content, :title, :subtitle)
  end

end