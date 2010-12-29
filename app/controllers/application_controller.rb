class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to denied_url
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    invalid_page
  end

  private

    def invalid_page
      render :file => "#{Rails.root}/public/404.html", :status => :not_found
    end

end
