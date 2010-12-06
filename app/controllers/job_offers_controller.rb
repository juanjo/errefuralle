class JobOffersController < ApplicationController

  def index
    @job_offers = JobOffer.all
  end
  
  def show
    @job_offer = JobOffer.find(params[:id])
  end

end
