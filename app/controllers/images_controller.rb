class ImagesController < ApplicationController
  include Shared::DoesEntriesController[:image, domain: :gallery]

  before_action :require_login

  private

  def permitted_params
    [
      :creator_id,
      :name,
      :description,
      :file,
      :gallery_id,
      gallery_attributes:
      [
        :creator_id,
        :name,
        :description,
        :category_id,
        category_attributes: [
          :name,
          :priority,
        ],
      ],
    ]
  end

end
