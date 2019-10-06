class BookmarksController < ApplicationController
  include Shared::DoesEntriesController[:bookmark]

  power :bookmarks, map: {
    [:update] => :updatable_bookmarks,
    [:new, :create] => :creatable_bookmarks,
    [:destroy] => :updatable_bookmarks
  }, as: :bookmark_scope

  private

  def permitted_params
    [ :creator_id, :drawer_id, :name, :description, :drawer, :url ]
  end

end
