class Image < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :gallery

  accepts_nested_attributes_for :gallery

  mount_uploader :file, ImageUploader

  validates :creator, :name, presence: true
  validates :file, presence: true

  def to_s
    name
  end

end
