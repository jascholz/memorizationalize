class IdeasController < ApplicationController
  include Shared::DoesEntriesController[:idea]

  before_action :require_login

  private

  def permitted_params
    [ :creator_id, :category_id, :name, :description, :category ]
  end

end
