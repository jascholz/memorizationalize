class AttachmentsController < ApplicationController
  include Shared::DoesEntriesController[:attachment]

  power :attachments, map: {
    [:update] => :updatable_attachments,
    [:new, :create] => :creatable_attachments,
    [:destroy] => :updatable_attachments
  }, as: :attachment_scope

  private

  def permitted_params
    [ :creator_id, :drawer_id, :name, :description, :file, :folder ]
  end

end
