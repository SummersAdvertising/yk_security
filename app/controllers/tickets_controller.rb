# encoding: utf-8
class TicketsController < ApplicationController
  
  
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]  
  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.order( "updated_at DESC" )
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create  
    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if verify_recaptcha && @ticket.save
      	
      	TicketsMailer.new_ticket( @ticket ).deliver
      
        format.html { redirect_to new_ticket_path, notice: '感謝您的聯絡，請等候服務專員聯絡！' }
        format.json { render action: 'show', status: :created, location: @ticket }
      else
        
      	flash[ :warning ] = @ticket.errors.messages.values.flatten.join('<br />')
      	
        unless verify_recaptcha
        	flash[ :warning ] = '請輸入正確的驗證碼'
        end
      	
      	
        format.html { render action: 'new' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
     
     Rails.logger.debug " **** Entering debug **** "
     Rails.logger.debug  params.require(:ticket).permit(:name, :company, :phone, :phone_area, :phone_ext, :mobile, :address, :email, :humanizer_answer, {:services => [] }, :status)
     Rails.logger.debug " **** End **** "
     
      params.require(:ticket).permit(:name, :company, :phone, :phone_area, :phone_ext, :mobile, :address, :email, :humanizer_answer, :humanizer_question_id, {:services => [] }, :status)
    end
end
