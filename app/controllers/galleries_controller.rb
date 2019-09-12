class GalleriesController < ApplicationController

  power :galleries, map: {
    [:update] => :updatable_galleries,
    [:new, :create] => :creatable_galleries,
    [:destroy] => :updatable_galleries
  }, as: :gallery_scope

  def show_all
    load_gallery
    @gallery.update_attribute(:show_all, gallery_params[:show_all])
  end

  private

  def load_gallery
    @gallery ||= gallery_scope.find(gallery_params[:id])
  end

  def gallery_params
    gallery_params = params[:gallery_id]
    gallery_params ? user_params.permit(:show_all) : {}
  end

end
