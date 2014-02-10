class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  
  protect_from_forgery with: :exception

=begin  
  after_filter :process_page_num
  def default_url_options(options={})  
    if !cookies[ :last_page_num ].nil?
    	{ :page => cookies[ :last_page_num ] }
    else
    	{}
    end
  end  
  
  def process_page_num
  	cookies[ :last_page_num ] = nil
  end
=end
  
end
