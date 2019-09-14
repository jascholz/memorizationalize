class DrawersController < ApplicationController

  before_action :require_confirmed, only: [:create]
  skip_before_action :require_login, only: [:new, :invitation]

  power :drawers, map: {
    [:update, :invite_code] => :updatable_drawers,
    [:new, :create] => :creatable_drawers,
    [:destroy] => :destroyable_drawers
  }, as: :drawer_scope

  def index
    load_drawers
    build_drawer
    build_drawer_invitation
    render layout: 'modal'
  end

  def new
    build_drawer
    build_drawer_invitation
    render layout: 'plain'
  end

  def create
    build_drawer
    save_drawer
  end

  def invitation
    build_drawer_invitation
    save_drawer_invitation
  end

  def invite_code
    load_drawer
    @drawer.generate_invite_code
    @drawer.save
    redirect_to drawers_path, layout: 'modal'
  end

  private

  def load_drawers
    @drawers = drawer_scope
  end

  def load_drawer
    @drawer = drawer_scope.find(params[:id])
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
      current_user.drawer_mappings.create(drawer: @drawer_invitation.drawer, may_edit: true)
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
