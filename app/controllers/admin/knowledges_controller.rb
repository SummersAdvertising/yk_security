# encoding: utf-8
class Admin::KnowledgesController < AdminController
  before_filter :get_chapter
  before_action :set_knowledge, only: [:show, :edit, :update, :destroy]

  # GET /admin/knowledge/1
  # GET /admin/knowledge/1.json
  def show
  end

  # GET /admin/knowledge/new
  def create
  	
    @knowledge = @chapter.knowledges.build
    @knowledge.article = Article.new
    @knowledge.title = "未命名標題"
    @knowledge.save

    respond_to do |format|
        format.html { redirect_to edit_admin_chapter_knowledge_path( @chapter,@knowledge), notice: '最新消息已建立.' }
        format.json { render action: 'show', status: :created, location: @knowledge }
    end
  end

  # GET /admin/knowledge/1/edit
  def edit
  end

  # PATCH/PUT /admin/knowledge/1
  # PATCH/PUT /admin/knowledge/1.json
  def update
    respond_to do |format|
      if @knowledge.update(knowledge_params) && ( params[ :article ].nil? ^ @knowledge.article.update( params.require(:article).permit(:content) ) )
        format.html { redirect_to admin_chapter_knowledge_path( @chapter,@knowledge), notice: 'Knowledge was successfully updated.' }
        format.js
        format.json { head :no_content }
      else
      	flash[ :warning ] = @knowledge.errors.full_messages.join('<br>')
        format.html { render action: 'edit' }
        format.json { render json: @knowledge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/knowledge/1
  # DELETE /admin/knowledge/1.json
  def destroy
    @knowledge.destroy
    respond_to do |format|
      format.html { redirect_to knowledge_index_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_knowledge
      @knowledge = Knowledge.find(params[:id])
    end
    
    def get_chapter
      @chapter = Chapter.find( params[ :chapter_id ] )    	
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def knowledge_params
      params.require(:knowledge).permit(:title, :content, :status)
    end

end
