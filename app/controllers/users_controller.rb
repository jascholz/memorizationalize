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
    load_user_form
    build_user
    save_user
  end

  private

  def load_user
    @user ||= user_scope.find(params[:id])
  end

  def load_user_form
    @user ||= ActiveType::cast(user_scope.find(params[:id]), User::Form)
  end

  def build_user
    @user ||= ActiveType::cast(user_scope.build, User::Form)
    @user.attributes = user_params
  end

  def save_user
    action = @user.new_record? ? :new : :edit
    if @user.save
      sign_in @user if action == :new
      redirect_to root_path
    else
      render action
    end
  end

  def user_params
    user_params = params[:user]
    user_params.delete(:password) if user_params[:password]&.empty?
    permitted_user_params = [
      :name,
      :email,
      :password,
      :'calendar_date(1i)',
      :'calendar_date(2i)',
      :'calendar_date(3i)',
      :calendar_day_selected,
      category_mappings_attributes: [:id, :selected],
    ]
    user_params ? user_params.permit(permitted_user_params) : {}
  end

  def user_scope
    User.all
  end

end
