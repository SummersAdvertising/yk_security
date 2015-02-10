module AdminHelper
	# this is helper generated with custom settings
	attr_reader :admins, :admin
  def javascript(*files)
    content_for(:specific_js_head) { javascript_include_tag(*files) }
  end
end