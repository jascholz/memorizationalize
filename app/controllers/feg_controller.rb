class FegController < ApplicationController
  skip_before_action :require_login

  def show
    @page_title = 'feg'
    render layout: 'feg'
  end

  def calendar
    @page_title = 'calendar'
    render layout: 'feg'
  end

  def about_us
    @page_title = 'about_us'
    render layout: 'feg'
  end

  def our_believes
    @page_title = 'our_believes'
    render layout: 'feg'
  end

  def news
    @page_title = 'news'
    render layout: 'feg'
  end

  def program
    send_file(
      Rails.root.join('public', 'jahresplan_2021.pdf'),
      filename: 'jahresplan_2021.pdf',
      type: 'application/pdf',
      disposition: 'inline',
    )
  end

end
