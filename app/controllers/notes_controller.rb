class NotesController < ApplicationController
  include Shared::DoesEntriesController[:note]

  before_action :require_login

  private

  def permitted_params
    [ :creator_id, :category_id, :name, :description, :category ]
  end

end
