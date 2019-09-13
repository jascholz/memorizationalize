class DrawersController < ApplicationController

  before_action :require_confirmed, only: [:create]
  skip_before_action :require_login, only: [:new, :invitation]

  power :drawers, map: {
    [:update] => :updatable_drawers,
    [:new, :create] => :creatable_drawers,
    [:destroy] => :destroyable_drawers
  }, as: :drawer_scope

  def index
    load_drawers
    render layout: 'modal'
  end

  def new
    build_drawer
    build_drawer_invitation
    if current_user.confirmed? && current_user.drawers.any?
      render layout: 'modal'
    else
      render layout: 'plain'
    end
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
    @drawers = drawer_scope
  end

  def build_drawer
    @drawer ||= ActiveType.cast(drawer_scope.build, Drawer::Form)
    @drawer.attributes = drawer_params
  end

  def build_drawer_invitation
    @drawer_invitation ||= Drawer::Invitation.new
    @drawer_invitation.attributes = drawer_invitation_params
  end

  def save_drawer
    action = @drawer.new_record? ? :new : :edit
    if @drawer.save
      current_user.drawer_mappings.create(drawer: @drawer, may_edit: true)
      redirect_to root_path
    else
      build_drawer_invitation

      if current_user.confirmed?
        render action, layout: 'modal'
      else
        render action, layout: 'plain'
      end
    end
  end

  def save_drawer_invitation
    if @drawer_invitation.valid?
      current_user.drawers << @drawer_invitation.drawer
      redirect_to root_path
    else
      build_drawer
      if current_user.confirmed?
        render :new, layout: 'modal'
      else
        render :new, layout: 'plain'
      end
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
      :invite_code,
    ]
    drawer_invitation_params ? drawer_invitation_params.permit(permitted_drawer_invitation_params) : {}
  end

end
