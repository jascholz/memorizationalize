class NotesController < ApplicationController
  include Shared::DoesEntriesController[:note]

  before_action :require_login

  def destroy
    load_note
    @note.destroy
    redirect_to root_path
  end

  private

  def permitted_params
    [
      :creator_id,
      :category_id,
      :name,
      :description,
      :category,
      :post_it_x,
      :post_it_y,
    ]
  end

end
