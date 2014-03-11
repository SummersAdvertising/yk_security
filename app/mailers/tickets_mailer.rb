# encoding: utf-8
class TicketsMailer < ActionMailer::Base
  default from: "\"誼光保全官網\" <yksanalytics@gmail.com>"
  
  def new_ticket( ticket )
  	@ticket = ticket
  	
  	mail( :to => Admin.pluck( :email ), :subject => '收到了新的詢問！' ) do | format |
  		format.html { render 'new_ticket' }
  	end
  	
  	
  end
  
end
