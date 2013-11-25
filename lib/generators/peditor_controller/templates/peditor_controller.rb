# encoding: utf-8
<% if namespaced? -%>
require_dependency "<%= namespaced_path %>/application_controller"

<% end -%>

<% module_namespacing do -%>
class <%= class_name %>Controller < ApplicationController
  before_action :set_<%= singular_table_name %>, only: [:show, :edit, :update, :destroy]

  # GET /admin/<%= route_url %>
  # GET /admin/<%= route_url %>.json
  def index
    @<%= singular_table_name %> = <%= orm_class.all(class_name) %>
  end

  # GET /admin/<%= route_url %>/1
  # GET /admin/<%= route_url %>/1.json
  def show
  end

  # GET /admin/<%= route_url %>/new
  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
    @<%= singular_table_name %>.article = Article.new    
    @<%= singular_table_name %>.save

    respond_to do |format|
        format.html { redirect_to edit_admin_<%= singular_table_name %>_path(@<%= class_name %>), notice: '最新消息已建立.' }
        format.json { render action: 'show', status: :created, location: @<%= class_name %> }
    end
  end

  # GET /admin/<%= route_url %>/1/edit
  def edit
  end

  # PATCH/PUT /admin/<%= route_url %>1
  def update
    respond_to do |format|
      if @<%= orm_instance.update("#{singular_table_name}_params") %> && ( params[ :article ].nil? ^ @<%= singular_table_name %>.article.update( params.require(:article).permit(:content) ) )
        format.html redirect_to @<%= singular_table_name %>, notice: <%= "'#{human_name} was successfully updated.'" %>
        format.js
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @<%= singular_table_name %>.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/<%= route_url %>/1
  # DELETE /admin/<%= route_url %>/1.json
  def destroy
    @<%= singular_table_name %>.destroy
    respond_to do |format|
      format.html { redirect_to admin_<%= index_helper %>_url }
      format.json { head :no_content }
    end
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_<%= singular_table_name %>
      @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    end

    # Only allow a trusted parameter "white list" through.
    def <%= "#{singular_table_name}_params" %>
      <%- if attributes_names.empty? -%>
      params[<%= ":#{singular_table_name}" %>]
      <%- else -%>
      params.require(<%= ":#{singular_table_name}" %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
      <%- end -%>
    end
end
<% end -%>
