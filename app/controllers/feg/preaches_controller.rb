class Feg::PreachesController < ApplicationController
  skip_before_action :require_login

  def index
    @page_title = 'preaches'
    @preaches = Feg::Preach.all.order(date: :desc)
    render layout: 'feg'
  end
end
