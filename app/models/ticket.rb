# encoding: utf-8
class Ticket < ActiveRecord::Base
	serialize :services, Array
		
	validates_presence_of :name, :message => "請輸入您的名字"
	validates_presence_of :phone, :message => "請輸入電話或行動電話"
	validates_presence_of :mobile, :message => "請輸入電話或行動電話", :if => "phone.nil?"
	
	
	
end
