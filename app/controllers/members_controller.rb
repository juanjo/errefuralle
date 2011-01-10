# encoding: utf-8
class MembersController < ApplicationController
  load_and_authorize_resource :class => "User"

  def index
    @members      = User.confirmed
    @admins       = Role[:admin].users.count
    @editors      = Role[:editor].users.count
    @registered   = User.confirmed.count - @admins - @editors
    @unconfirmed  = User.unconfirmed.count
  end

  def edit
    @member = User.find(params[:id])
    
    unless @member.confirmed_at
      flash[:error] = 'No es posible editar a un usuario no confirmado.'
      redirect_to members_url
    end
    
  end

  def update
    @member = User.find(params[:id])
    
    if @member.update_attributes(params[:user])
      @member.roles.delete_all
      (params[:role_id] || []).each { |i| @member.roles << Role[i.to_sym] }
      
      flash[:notice] = 'Usuario modificado con éxito.'
      redirect_to members_url
    else
      flash.now[:error] = 'Algún error al intentar modifcar usuario.'
      render :action => 'edit'
    end
    
  end

  def destroy
    @member = User.find(params[:id])
    
    unless @member == User.first
      @member.destroy
      flash[:notice] = 'Usuario eliminado con éxito.'
    else
      flash[:error] = 'No es posible eliminar a este usuario.'
    end
    
    redirect_to members_url
  end
end
