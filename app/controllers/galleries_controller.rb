class GalleriesController < ApplicationController

  before_action :require_login

  def show_all
    load_gallery
    @gallery.update_attribute(:show_all, gallery_params[:show_all])
  end

  private

  def load_gallery
    @gallery ||= Gallery.find(gallery_params[:id])
  end

  def gallery_params
    gallery_params = params[:gallery_id]
    gallery_params ? user_params.permit(:show_all) : {}
  end

end
