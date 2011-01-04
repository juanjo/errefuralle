# encoding: utf-8
class SnippetsController < ApplicationController
  load_and_authorize_resource
  
  respond_to :html, :R, :only => :show

  def index
    @snippets = Snippet.with_state(:published).paginate(:page => params[:page], :order => 'created_at DESC', :per_page => 8, :include => [:user])
  end

  def show
    @snippet = Snippet.find(params[:id])
    respond_with(@snippet) do |format|  
      format.R { render :text => @snippet.code }  
    end
  end

  def new
    @snippet = Snippet.new
  end
  
  def create
    @snippet.user = current_user
    if @snippet.save
      flash[:notice] = 'Fragmento de código creado con éxito.'
      redirect_to @snippet
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @snippet.update_attributes(params[:snippet])
      flash[:notice] = 'Fragmento de código actualizado con éxito.'
      redirect_to @snippet
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @snippet.destroy
    flash[:notice] = 'Fragmento de código eliminado.'
    redirect_to snippets_url
  end


end
