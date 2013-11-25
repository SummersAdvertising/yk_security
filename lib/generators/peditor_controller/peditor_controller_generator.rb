require 'rails/generators/resource_helpers'

class PeditorControllerGenerator < Rails::Generators::NamedBase # :nodoc:

  include Rails::Generators::ResourceHelpers

  source_root File.expand_path('../templates', __FILE__)
  
#  argument :actions, type: :array, default: [], banner: "action action"
  
  
  check_class_collision suffix: "Controller"

  class_option :orm, banner: "NAME", type: :string, required: true,
                     desc: "ORM to generate the controller for"

  argument :attributes, type: :array, default: [], banner: "field:type field:type"
    
  def create_controller_files
  	template "peditor_controller.rb", File.join('app/controllers', class_path, "#{file_name}_controller.rb")
  end
  
  
  
  hook_for :template_engine, :test_framework

  # Invoke the helper using the controller name (pluralized)
  # hook_for :helper, as: :scaffold do |invoked|
  #  invoke invoked, [ controller_name ]
  # end
  
 # hook_for :template_engine, :test_framework, :helper, :assets
  
end