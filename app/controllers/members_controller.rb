class MembersController < ApplicationController
  load_and_authorize_resource :class => "User"

  def index
    @members      = User.confirmed
    @admins       = Role.find_by_name('Admin').users.count
    @editors      = Role.find_by_name('Editor').users.count
    @registered   = User.confirmed.count - @admins - @editors
    @unconfirmed  = User.unconfirmed.count
  end

  def edit
    @member = User.find(params[:id])
    
    unless @member.confirmed_at
      flash[:error] = 'No es posible editar a un usuario no confirmado'
      redirect_to members_url
    end
    
  end

  def update
    @member = User.find(params[:id])
    
    if @member.update_attributes(params[:user])
      @member.roles.delete_all
      (params[:role_id] || []).each { |i| @member.roles << Role.find(i) }
      
      flash[:notice] = 'Usuario modificado con exito'
      redirect_to members_url
    else
      render :action => 'edit'
    end
    
  end

  def destroy
    @member = User.find(params[:id])
    
    unless @member == User.first
      @member.destroy
      flash[:notice] = 'Usuario eliminado con exito'
    else
      flash[:error] = 'No es posible eliminar a este usuario'
    end
    
    redirect_to members_url
  end
end
