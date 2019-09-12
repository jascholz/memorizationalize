class TodosController < ApplicationController
  include Shared::DoesEntriesController[:todo]

  power :todos, map: {
    [:update] => :updatable_todos,
    [:new, :create] => :creatable_todos,
    [:destroy] => :updatable_todos
  }, as: :todo_scope

  private

  def permitted_params
    [
      :creator_id,
      :name,
      :description,
      :done,
      :deadline,
      :priority,
      :drawer_id,
      drawer_attributes: [
        :name,
        :priority,
      ],
    ]
  end
end
