class AdminController < ApplicationController

  before_action :require_admin

  def index
    load_klasses
  end

  private

  def load_klasses
    Rails.application.eager_load!
    @klasses = ApplicationRecord.descendants.collect(&:name).compact.collect(&:constantize)
  end

  def require_admin
    redirect_to root_path if current_user.role != 'admin'
  end

end
