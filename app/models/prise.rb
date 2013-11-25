# encoding: utf-8
class Prise < ActiveRecord::Base

	has_many :honorees, :dependent => :destroy
#	accepts_nested_attributes_for :honorees
	
	validates_uniqueness_of :month, :message => '月份重複'
	
	validates_presence_of :title, :message => '表揚標題不得空白'
	
	paginates_per 20
end
