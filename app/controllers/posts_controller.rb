# encoding: utf-8
class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @posts = Post.all.paginate(:order => 'posts.created_at DESC', :include => [:user]).paginate(:page => params[:page], :per_page => 8)
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post.user = current_user
    if @post.save
      flash[:notice] = 'Mini-noticia creada con éxito.'
      redirect_to @post
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @post.update_attributes(params[:post])
      flash[:notice] = 'Mini-noticia modificada con éxito.'
      redirect_to @post
    else
      render :action => 'edit'
    end    
  end
  
  def destroy
    @post.destroy
    flash[:notice] = 'Moni-noticia eliminada.'
    redirect_to posts_url
    
  end
end
