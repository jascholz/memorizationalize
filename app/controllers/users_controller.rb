class UsersController < ApplicationController

  before_action :require_login, except: [:new, :create]

  def show
    load_user
  end

  def create
    build_user
    save_user
  end

  def new
    build_user
  end

  def update
    load_user
    build_user
    save_user
  end

  private

  def load_user
    @user ||= user_scope.find(params[:id])
  end

  def build_user
    @user ||= ActiveType::cast(user_scope.build, User::Form)
    @user.attributes = user_params
  end

  def save_user
    action = @user.new_record? ? :new : :edit
    debugger
    if @user.save
      sign_in @user if action == :new
      redirect_to root_path
    else
      render action
    end
  end

  def user_params
    user_params = params[:user]
    user_params ? user_params.permit(:name, :email, :password, category_mappings_attributes: [:id, :selected]) : {}
  end

  def user_scope
    User.all
  end

end
