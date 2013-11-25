class Ticket < ActiveRecord::Base
	serialize :services, Array
end
