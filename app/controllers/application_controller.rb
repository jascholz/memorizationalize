class ApplicationController < ActionController::Base
  include Consul::Controller
  include Devise::Controllers::Helpers

  protect_from_forgery(with: :exception, prepend: true)
  before_action :require_login, except: [:new, :create]
  around_action :switch_locale

  current_power do
    Power.new(current_user)
  end

  private

  def switch_locale(&action)
    locale = I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def require_login
    if !user_signed_in?
      redirect_to new_session_path, layout: 'plain'
    elsif current_user.drawers.empty?
      redirect_to new_drawer_path, layout: 'plain'
    end
  end

  def require_confirmed
    if user_signed_in? && !current_user.confirmed?
      if current_user.drawers.empty?
        redirect_to new_drawer_path, layout: 'plain'
      end
    end
  end

end
