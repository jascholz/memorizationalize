class United::BaseController < ApplicationController
  layout 'united'

  skip_before_action :require_login
  before_action :united_authentication
  before_action :init

  private

  def united_authentication
    redirect_to new_session_path, layout: 'plain' unless user_signed_in?
  end

  def init
    @current_user = ActiveType.cast(current_user, United::User)
    I18n.locale = :de
  end

end
