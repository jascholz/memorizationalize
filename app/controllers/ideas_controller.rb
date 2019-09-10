class IdeasController < ApplicationController
  include Shared::DoesEntriesController[:idea]

  private

  def permitted_params
    [ :creator_id, :drawer_id, :name, :description, :drawer ]
  end

end
