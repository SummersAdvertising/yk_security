class Admin::PhotosController < AdminController
	def resize
	
		@photo = Photo.find( params[ :id ] )
	
		@path = "public/uploads/"+ @photo.article_id.to_s + "/" + @photo.id.to_s + "-" + @photo.name
		
		image = MiniMagick::Image.open( @path )
		image.crop "#{params[:width]}x#{params[:height]}+#{params[:x1]}+#{params[:y1]}"
		
		image.write @path
		
		respond_to do | format |
			format.js
		end
	
	end
	
	
end
