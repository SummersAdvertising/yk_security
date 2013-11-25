# encoding: utf-8
class Admin::NewsController < AdminController
  before_action :set_news, only: [:show, :edit, :update, :destroy]
  
  # GET /admin/news
  # GET /admin/news.json
  def index
    @news = News.all.page(params[:page])
  end

  # GET /admin/news/1
  # GET /admin/news/1.json
  def show
  end

  # GET /admin/news/new
  def create
    @news = News.new
    @news.article = Article.new    
    @news.title = "未命名標題"
    @news.save

    respond_to do |format|
        format.html { redirect_to edit_admin_news_path(@news), notice: '最新消息已建立.' }
        format.json { render action: 'show', status: :created, location: @news }
    end
  end

  # GET /admin/news/1/edit
  def edit
  end

  # PATCH/PUT /admin/news/1
  # PATCH/PUT /admin/news/1.json
  def update
    respond_to do |format|
      if @news.update(news_params) && ( params[ :article ].nil? ^ @news.article.update( params.require(:article).permit(:content) ) )
        format.html { redirect_to admin_news_path(@news), notice: 'News was successfully updated.' }
        format.js
        format.json { head :no_content }
      else
      	flash[ :warning ] = @news.errors.full_messages.join( '<br>' )
        format.html { render action: 'edit' }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/news/1
  # DELETE /admin/news/1.json
  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to admin_news_index_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:title, :cover, :content, :status)
    end
    
end
