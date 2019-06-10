class Users::SessionsController < ApplicationController

  def new
    @session = User::Session.new
  end

  def create
    @user = User.find_by(email: params[:user_session][:email])
    sign_in @user if @user
    redirect_to root_path
  end

  def destroy
    sign_out if user_signed_in?
    redirect_to new_session_path
  end

end
