class HomeController < ApplicationController

  before_action :require_login

  def show
    build_new_category
    load_entries
  end

  private

  def build_new_category
    @category= current_user.categories.build
  end

  def load_entries
    @todos = Todo.undone
    @notes = Note.all
    @ideas = Idea.all
    @galleries = Gallery.all
    @images = Image.where(gallery: nil)
  end
end
