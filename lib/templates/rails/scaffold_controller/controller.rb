# encoding: UTF-8
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

    if @<%= orm_instance.save %>
      redirect_to({:action => 'index'}, {:notice => '<%= human_name %> добавлен'})
    else
      render :action, '"new"'
    end
  end

  # PUT <%= route_url %>/1
  def update
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>

    if @<%= orm_instance.update_attributes("params[:#{singular_table_name}]") %>
      redirect_to(@<%= singular_table_name %>, :notice => 'Изменения внесены')
    else
      render :action, '"edit"'
    end
  end

  # DELETE <%= route_url %>/1
  def destroy
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    @<%= orm_instance.destroy %>

    redirect_to (<%= index_helper %>_url)
  end
end
