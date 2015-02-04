module ApplicationHelper
  def javascript(*files)
    content_for(:specific_js_head) { javascript_include_tag(*files) }
  end
end
