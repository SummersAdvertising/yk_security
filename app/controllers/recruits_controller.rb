# encoding: utf-8
class RecruitsController < ApplicationController
  before_action :set_recruit, only: [:show, :edit, :update, :destroy]
  # GET /recruits/new
  def new
    @recruit = Recruit.new
  end

  # POST /recruits
  # POST /recruits.json
  def create
	 params[ :recruit][ :birthday ] = params[ :recruit][ :birthday ].map{ | k, v | v }.join('/')
	 
    @notice = Notice.find( params[ :notice_id ] )
    @recruit = @notice.recruits.build(recruit_params)

    respond_to do |format|
      if @recruit.save
      
      	@notice.uncheck
      
        format.html { redirect_to notice_path( @notice ), notice: '感謝您的應徵，請等候專員聯絡！' }
        format.json { render action: 'show', status: :created, location: @recruit }
      else
        format.html { render action: 'new' }
        format.json { render json: @recruit.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recruit
      @recruit = Recruit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recruit_params
      params.require(:recruit).permit(:name, :notice_id, :sex, :birthday, :phone, :address, :email, :educated, :experience, :brief, :status, :checked)
    end
end
