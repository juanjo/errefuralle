class SnippetsController < ApplicationController
  load_and_authorize_resource
  #before_filter :authenticate_user!

  def index
    @snippets = Snippet.all
  end

  def show
    @snippet = Snippet.find(params[:id])
  end

end
