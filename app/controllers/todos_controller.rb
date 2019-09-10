class TodosController < ApplicationController
  include Shared::DoesEntriesController[:todo]

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
