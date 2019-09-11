class UsersController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]

  def show
    load_user
  end

  def create
    build_user
    save_user
  end

  def new
    build_user
    render layout: 'plain'
  end

  def update
    load_user_form
    build_user
    save_user
  end

  def destroy
    load_user
    @user.trash!
    redirect_to root_path
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
      render action, layout: 'plain'
    end
  end

  def user_params
    user_params = params[:user]
    permitted_user_params = [
      :name,
      :email,
      :password,
      :confirmed,
      :sign_up_message,
      :'calendar_date(1i)',
      :'calendar_date(2i)',
      :'calendar_date(3i)',
      :calendar_day_selected,
      drawer_mappings_attributes: [:id, :selected],
    ]
    if user_params
      user_params.delete(:password) if user_params[:password]&.empty?
      user_params.permit(permitted_user_params)
    else
       {}
    end
  end

  def user_scope
    User.active
  end

end
