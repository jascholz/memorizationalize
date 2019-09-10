class DrawersController < ApplicationController

  def index
    load_drawers
    render layout: 'modal'
  end

  def new
    build_drawer
    build_drawer_invitation
    render layout: 'plain' if !current_user.confirmed?
  end


  def create
    build_drawer
    save_drawer
  end

  def invitation
    build_drawer_invitation
    save_drawer_invitation
  end

  private

  def load_drawers
    @drawers = current_user.drawers
  end

  def build_drawer
    attributes = drawer_params
    @drawer ||= current_user.drawers.build
    @drawer.attributes = drawer_params
  end

  def build_drawer_invitation
    attributes = drawer_invitation_params
    @drawer_invitation ||= Drawer::Invitation.new
    @drawer_invitation.attributes = drawer_invitation_params
  end

  def save_drawer
    action = @drawer.new_record? ? :new : :edit
    if @drawer.save
      current_user.drawers << @drawer
      redirect_to root_path
    else
      build_drawer_invitation
      render action, layout: 'plain'
    end
  end

  def save_drawer_invitation
    if @drawer_invitation.valid?
      current_user.drawers << @drawer_invitation.drawer
      redirect_to root_path
    else
      build_drawer
      render :new, layout: 'plain'
    end
  end

  def drawer_params
    drawer_params = params[:drawer]
    permitted_drawer_params = [
      :name,
      :color,
      :description,
    ]
    drawer_params ? drawer_params.permit(permitted_drawer_params) : {}
  end

  def drawer_invitation_params
    drawer_invitation_params = params[:drawer_invitation]
    permitted_drawer_invitation_params = [
      :invitation_code,
    ]
    drawer_invitation_params ? drawer_invitation_params.permit(permitted_drawer_invitation_params) : {}
  end

end
