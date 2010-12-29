class PostsController < ApplicationController
  def index
    @posts = Post.all.paginate(:page => params[:page], :order => 'created_at DESC', :per_page => 8, :include => [:user])
  end
end
