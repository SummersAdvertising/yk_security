# encoding: utf-8
class Admin::InstructionsController < AdminController

  before_action :set_instruction, only: [:show, :edit, :update, :destroy]

  # GET /admin/instruction
  # GET /admin/instruction.json
  def index
    @instructions = Instruction.all.page( params[:page] )
  end

  # GET /admin/instruction/1
  # GET /admin/instruction/1.json
  def show
  end

  # GET /admin/instruction/new
  def create
    @instruction = Instruction.new
    @instruction.article = Article.new
    @instruction.title = "未命名標題"
    @instruction.save

    respond_to do |format|
        format.html { redirect_to edit_admin_instruction_path(@instruction), notice: '教育訓練已建立.' }
        format.json { render action: 'show', status: :created, location: @instruction }
    end
  end

  # GET /admin/instruction/1/edit
  def edit
  end

  # PATCH/PUT /admin/instruction/1
  # PATCH/PUT /admin/instruction/1.json
  def update
    respond_to do |format|
      if @instruction.update(instruction_params) && ( params[ :article ].nil? ^ @instruction.article.update( params.require(:article).permit(:content) ) )
        format.html { redirect_to admin_instruction_path(@instruction), notice: 'Instruction was successfully updated.' }
        format.js
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @instruction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/instruction/1
  # DELETE /admin/instruction/1.json
  def destroy
    @instruction.destroy
    respond_to do |format|
      format.html { redirect_to admin_instructions_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instruction
      @instruction = Instruction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instruction_params
      params.require(:instruction).permit(:title, :cover, :content, :status)
    end
end
