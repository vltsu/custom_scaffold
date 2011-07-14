# encoding: UTF-8
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  # GET <%= route_url %>
  def index
    @<%= plural_table_name %> = <%= class_name %>.paginate :page => params[:page], :order => 'id DESC'
  end

  # GET <%= route_url %>/1
  def show
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
  end

  # GET <%= route_url %>/new
  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
  end

  # GET <%= route_url %>/1/edit
  def edit
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
  end

  # POST <%= route_url %>
  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "params[:#{singular_table_name}]") %>

    respond_to do |format|
      if @<%= orm_instance.save %>
        format.html { redirect_to @<%= singular_table_name %>, <%= key_value :notice, "'#{human_name} создан.'" %> }
      else
        format.html { render <%= key_value :action, '"new"' %> }
      end
    end
  end

  # PUT <%= route_url %>/1
  def update
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>

    respond_to do |format|
      if @<%= orm_instance.update_attributes("params[:#{singular_table_name}]") %>
        format.html { redirect_to @<%= singular_table_name %>, <%= key_value :notice, "'#{human_name} изменен.'" %> }
      else
        format.html { render <%= key_value :action, '"edit"' %> }
      end
    end
  end

  # DELETE <%= route_url %>/1
  def destroy
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    @<%= orm_instance.destroy %>

    respond_to do |format|
      format.html { redirect_to <%= index_helper %>_url }
    end
  end
end
<% end -%>
