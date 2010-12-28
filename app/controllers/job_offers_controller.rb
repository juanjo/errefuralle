class JobOffersController < ApplicationController
  load_and_authorize_resource

  def index
    @job_offers = JobOffer.with_state(:published).paginate(:page => params[:page], :order => 'created_at DESC', :per_page => 15)
  end

  def show
    @job_offer = JobOffer.find(params[:id])
  end

  def new
    @job_offer = JobOffer.new
  end

  def create
    @job_offer.user = current_user
    if @job_offer.save
      flash[:notice] = 'JobOffer created successfully.'
      redirect_to @job_offer
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @job_offer.update_attributes(params[:job_offer])
      flash[:notice] = 'Updated successfully.'
      redirect_to @job_offer
    else
      render :action => 'edit'
    end
  end

  def destroy
    @job_offer.destroy
    flash[:notice] = 'JobOffer destroyed'
    redirect_to job_offers_url
  end

end
