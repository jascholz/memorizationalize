class Users::SessionsController < ApplicationController

  skip_before_action :require_login, except: [:new, :create]

  def new
    @session = User::Session.new
    render layout: 'plain'
  end

  def create
    @user = User.active.find_by(email: params[:user_session][:email])
    sign_in @user if @user

    if current_user.united_user?
      redirect_to united_path
    else
      redirect_to root_path
    end
  end

  def destroy
    sign_out if user_signed_in?
    redirect_to new_session_path
  end

end
