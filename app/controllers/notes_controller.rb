class NotesController < ApplicationController
  include Shared::DoesEntriesController[:note]

  power :notes, map: {
    [:update] => :updatable_notes,
    [:new, :create] => :creatable_notes,
    [:destroy] => :updatable_notes
  }, as: :note_scope

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
