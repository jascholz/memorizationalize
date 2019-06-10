class EventsController < ApplicationController
  include Shared::DoesEntriesController[:event]

  before_action :require_login

  private

  def permitted_params
    [
      :creator_id,
      :category_id,
      :name,
      :description,
      :category,
      :start_date,
      :end_date,
      :start_time,
      :end_time,
      :repeating_interval,
      :week_days,
    ]
  end

end
