#encoding: utf-8
class Admin::AdminsController < AdminController
 		def index
        
                @admins = Admin.all
                
                @admin = Admin.new
                
                respond_to do | format |
                        
                        format.html {  }
                        
                end
                
        
        end
        
        def show
                respond_to do | format |
                        format.html { redirect_to admin_admins_path }
                end
        end
        
        def new
        
        end
        
        def edit
                @admin = Admin.find( params[ :id ] )
                
                respond_to do | format |
                        format.html {  }
                end
                
        
        end
        
        def create
        
                @admin = Admin.new( admin_params )
                
                
                respond_to do | format |
                        if @admin.save
                                format.html { redirect_to admin_admins_path, :notice => '新增使用者成功' }
                        else
                                @admins = Admin.all
                                
                                messages = ''
                                
                                @admin.errors.messages.each do | m |
                                        messages += '<br />' + (m[1][1].nil? ? m[1][0].to_s : m[1][1].to_s)
                                
                                end
                                
                                flash[ :warning ] = "新增使用者失敗，請檢查以下訊息：<p>#{messages}</p>"
                                                                
                                format.html { render :index  }
                        end
                end
        
        end

        def update
                
                @admin = Admin.find( params[ :id ] )
        
                if params[:admin][:password].blank?
                        params[:admin].delete(:password)
                        params[:admin].delete(:password_confirmation)
                end
                
                respond_to do | format |
                        if @admin.update_attributes( admin_params )
                                format.html { redirect_to admin_admins_path }
                        else
                                format.html { render :edit }
                        end
                        
                
                end
        
        end
        
        def destroy
                @admin = Admin.find( params[ :id ] )
                
                @admin.destroy
                respond_to do | format |
                        format.html { redirect_to admin_admins_path,  :notice => '使用者刪除成功' }
                end
                
        end

private        
        def admin_params
	        	params.require(:admin).permit( :name, :email, :password, :password_comfirmation )
        end
end
