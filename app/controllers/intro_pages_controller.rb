class IntroPagesController < ApplicationController
  
  def show
    
    if params[ :page ].nil?
      redirect_to root_url
    end
    
    if params[:page].in? IntroPage.all.pluck(:page_name)

      @intro = IntroPage.where(page_name: params[:page]).first
      respond_to do | format |
        # format.html { render :show rescue redirect_to '/errors' }
        format.html { render :show  }
      end

    else
      #redirect_to '/errors'
    end

  end

end
