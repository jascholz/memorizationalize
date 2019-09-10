class NotesController < ApplicationController
  include Shared::DoesEntriesController[:note]

  def destroy
    load_note
    @note.destroy
    redirect_to root_path
  end

  private

  def permitted_params
    [
      :creator_id,
      :drawer_id,
      :name,
      :description,
      :drawer,
      :post_it_x,
      :post_it_y,
    ]
  end

end
