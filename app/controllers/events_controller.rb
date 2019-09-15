class EventsController < ApplicationController
  include Shared::DoesEntriesController[:event, domain: :calendar]

  before_action :require_login

  power :events, map: {
    [:update] => :updatable_events,
    [:new, :create] => :creatable_events,
    [:destroy] => :updatable_events
  }, as: :event_scope

  def new
    build_event
    if (params[:date])
      @event.start_date = params[:date]
      @event.end_date = params[:date]
    end
    render layout: 'modal'
  end

  private

  def permitted_params
    [
      :creator_id,
      :calendar_id,
      :name,
      :description,
      :start_date,
      :end_date,
      :start_time,
      :end_time,
      :repeating_interval,
      :all_day,
    ]
  end

end
