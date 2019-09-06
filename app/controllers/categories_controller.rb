class CategoriesController < ApplicationController

  def index
    load_categories
    render layout: 'modal'
  end

  private

  def load_categories
    @categories = current_user.categories
  end

end
