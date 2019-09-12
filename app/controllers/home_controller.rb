class HomeController < ApplicationController

  before_action :require_login

  def show
    load_entries
  end

  private

  def load_entries
    @users = current_power.users.active
    @todos = current_power.todos.undone
    @notes = current_power.notes.all
    @ideas = current_power.ideas.all
    @calendars = current_power.calendars.all
    @drawers = current_power.drawers.all
    @galleries = current_power.galleries.all
  end
end
