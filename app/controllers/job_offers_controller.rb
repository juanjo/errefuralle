# encoding: utf-8
class JobOffersController < ApplicationController
  load_and_authorize_resource

  def index
    @job_offers = JobOffer.with_state(:published).paginate(:page => params[:page], :order => 'created_at DESC', :per_page => 15, :include => [:user, :job_type])
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
      flash[:notice] = 'Oferta de trabajo creada con éxito.'
      redirect_to @job_offer
    else
      flash[:alert] = 'Algún error al intentar crear Oferta de trabajo.'
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @job_offer.update_attributes(params[:job_offer])
      flash[:notice] = 'Oferta de trabajo modificada con éxito.'
      redirect_to @job_offer
    else
      flash[:alert] = 'Algún error al modificar crear Oferta de trabajo.'
      render :action => 'edit'
    end
  end

  def destroy
    @job_offer.destroy
    flash[:notice] = 'Oferta de trabajo eliminada.'
    redirect_to job_offers_url
  end

end
