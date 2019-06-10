class Image < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :gallery, optional: true

  accepts_nested_attributes_for :gallery, reject_if: :reject_domain

  mount_uploader :file, ImageUploader

  validates :creator, :name, presence: true
  validates :file, presence: true

  def reject_domain(params)
    gallery_id != 0
  end
end
