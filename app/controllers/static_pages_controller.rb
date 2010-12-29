class StaticPagesController < ApplicationController
  #before_filter :authenticate_user!

  AVAILABLE_PAGES = %w(about community faq error denied markdown)
end
