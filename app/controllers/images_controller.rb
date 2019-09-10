class ImagesController < ApplicationController
  include Shared::DoesEntriesController[:image, domain: :gallery]

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
        :drawer_id,
        drawer_attributes: [
          :name,
          :priority,
        ],
      ],
    ]
  end

end
