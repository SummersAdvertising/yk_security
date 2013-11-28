class Admin::NoticesController < AdminController
  before_action :set_notice, only: [:show, :edit, :update, :destroy]

  # GET /notices
  # GET /notices.json
  def index
    @notices = Notice.all
  end

  # GET /notices/1
  # GET /notices/1.json
  def show
  	@notice.check if @notice.recruits.where(:checked => false).count <= 0
  	@recruits = @notice.recruits.order( "checked desc, created_at desc" ).all
  end

  # GET /notices/new
  def new
    @notice = Notice.new
  end

  # GET /notices/1/edit
  def edit
  end

  # POST /notices
  # POST /notices.json
  def create
    @notice = Notice.new(notice_params)

    respond_to do |format|
      if @notice.save
        format.html { redirect_to admin_notice_path(@notice), notice: 'Notice was successfully created.' }
        format.json { render action: 'show', status: :created, location: @notice }
      else
      	flash[ :warning ] = @notice.errors.full_messages.join( '<br>' )
        format.html { render action: 'new' }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notices/1
  # PATCH/PUT /notices/1.json
  def update
    respond_to do |format|
      if @notice.update(notice_params)
        format.html { redirect_to admin_notice_path(@notice), notice: 'Notice was successfully updated.' }
        format.json { head :no_content }
      else
      	flash[ :warning ] = @notice.errors.full_messages.join( '<br>' )
        format.html { render action: 'edit' }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notices/1
  # DELETE /notices/1.json
  def destroy
    @notice.destroy
    respond_to do |format|
      format.html { redirect_to admin_notices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notice
      @notice = Notice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notice_params
      params.require(:notice).permit(:title, :area, :content, :compensation, :job_type, :shift, :holiday, :experience, :educated, :comment, :contact_name, :contact_phone, :contact_address, :contact_email, :notice_type, :status)
    end
end
