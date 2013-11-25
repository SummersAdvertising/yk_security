# encoding: utf-8
class Notice < ActiveRecord::Base
	has_many :recruits, :dependent => :destroy
	before_save :defaults
	
	validates_presence_of :title, 						{ :message => '請輸入職務名稱。' }
	validates_presence_of :compensation, 		{ :message => '待遇說明不得空白。' }
	validates_presence_of :job_type, 				{ :message => '請輸入工作類型。' }
	validates_presence_of :area,  					{ :message => '請輸入工作地區。' }
	validates_presence_of :shift,  					{ :message => '請輸入上班時段。' }
	validates_presence_of :holiday, 				{ :message => '請輸入休假描述。' }
	validates_presence_of :experience, 			{ :message => '請輸入要求經驗。' }
	validates_presence_of :educated,			 	{ :message => '請輸入要求學歷。' }
	validates_presence_of :content, 				{ :message => '請簡述工作內容。' }
	validates_presence_of :contact_name, 		{ :message => '聯絡人不得空白。' }
	validates_presence_of :contact_phone,		{ :message => '聯絡電話必填。' }
	
 
 def defaults
 	self.notice_type ||= 'default'
 end
 
 def uncheck
 	self.update_attribute('checked', false)
 end
 
 def check
 	self.update_attribute('checked', true)
 end
 
end
