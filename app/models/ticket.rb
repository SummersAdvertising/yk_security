# encoding: utf-8
class Ticket < ActiveRecord::Base
	serialize :services, Array
	
end
