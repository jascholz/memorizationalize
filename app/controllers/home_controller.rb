class HomeController < ApplicationController

  before_action :require_login

  def show
    load_entries
  end

  private

  def load_entries
    @attachments = current_power.attachments.all
    @bookmarks = current_power.bookmarks.all
    @calendars = current_power.calendars.all
    @drawers = current_power.drawers.all
    @galleries = current_power.galleries.all
    @ideas = current_power.ideas.all
    @notes = current_power.notes.all
    @todos = current_power.todos.undone
    @users = current_power.users.active
  end
end
