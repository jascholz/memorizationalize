class UsersController < ApplicationController

  before_action :require_login, except: [:new, :create]

  def show
    load_user
  end

  def create
  end

  def new
    @user = User.new
  end

  def update
    load_user
    build_user
    save_user
  end

  private

  def load_user
    @user ||= User.find(params[:id])
  end

  def build_user
    @user ||= User.new
    @user.attributes = user_params
  end

  def save_user
    @user.save
    redirect_to root_path
  end

  def user_params
    user_params = params[:user]
    user_params ? user_params.permit(:name, :email, :password, category_mappings_attributes: [:id, :selected]) : {}
  end

end
