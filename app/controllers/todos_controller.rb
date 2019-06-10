class TodosController < ApplicationController
  include Shared::DoesEntriesController[:todo]

  before_action :require_login

  private

  def permitted_params
    [
      :creator_id,
      :name,
      :description,
      :done,
      :deadline,
      :priority,
      :category_id,
      category_attributes: [
        :name,
        :priority,
      ],
    ]
  end
end
