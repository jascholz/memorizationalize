class IdeasController < ApplicationController
  include Shared::DoesEntriesController[:idea]

  power :ideas, map: {
    [:update] => :updatable_ideas,
    [:new, :create] => :creatable_ideas,
    [:destroy] => :updatable_ideas
  }, as: :idea_scope

  private

  def permitted_params
    [ :creator_id, :drawer_id, :name, :description, :drawer ]
  end

end
