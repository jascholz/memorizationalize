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
    if !user_signed_in?
      redirect_to new_session_path, layout: 'plain'
    elsif current_user.drawers.empty?
      redirect_to new_drawer_path, layout: 'plain'
    end
  end

end
