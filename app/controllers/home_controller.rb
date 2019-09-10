class HomeController < ApplicationController

  before_action :require_login

  def show
    redirect_to :new_drawer, layout: 'plain' if current_user.drawers.empty?
    load_entries
  end

  private

  def load_entries
    @todos = Todo.undone
    @notes = Note.all
    @ideas = Idea.all
    @galleries = Gallery.all
    @images = Image.where(gallery: nil)
  end
end
