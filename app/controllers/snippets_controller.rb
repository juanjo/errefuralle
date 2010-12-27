class SnippetsController < ApplicationController
  load_and_authorize_resource

  def index
    @snippets = Snippet.with_state(:published).paginate(:page => params[:page], :order => 'created_at DESC', :per_page => 8)
  end

  def show
    @snippet = Snippet.find(params[:id])
  end

  def new
    @snippet = Snippet.new
  end
  
  def create
    @snippet.user = current_user
    if @snippet.save
      flash[:notice] = 'Snippet created successfully.'
      redirect_to @snippet
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @snippet.update_attributes(params[:snippet])
      flash[:notice] = 'Updated successfully.'
      redirect_to @snippet
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @snippet.destroy
    flash[:notice] = 'Snippet destroyed'
    redirect_to snippets_url
  end

end
