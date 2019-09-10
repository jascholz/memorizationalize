class ApplicationController < ActionController::Base
  include Consul::Controller
  include Devise::Controllers::Helpers
  
  protect_from_forgery(with: :exception, prepend: true)
  before_action :require_login, except: [:new, :create]

  current_power do
    Power.new(current_user)
  end

  private

  def require_login
    redirect_to new_session_path if !user_signed_in?
  end

end
