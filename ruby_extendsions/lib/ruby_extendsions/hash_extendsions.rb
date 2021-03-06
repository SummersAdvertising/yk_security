module RubyExtendsions
  module HashExtendsions
    def self.included( base )
      base.send :include, InstanceMethods
      base.send :extend, ClassMethods
    end

    module InstanceMethods
      def hash_reverse
	hash_new = {}
	self.each { |key, value|
	  if not hash_new.has_key?( key ) then hash_new[value] = key end
	}
	return hash_new
      end
    end

    module ClassMethods
      #TODO
    end

  end
end

class Hash
  include RubyExtendsions::HashExtendsions
end
