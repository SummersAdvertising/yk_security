# encoding: utf-8
class Honoree < ActiveRecord::Base
	belongs_to :prise
	mount_uploader :cover, HonoreeUploader
	
	validates_presence_of :name, :message => '表揚員工名稱不得空白'
end
