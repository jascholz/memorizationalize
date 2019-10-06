class Attachment < ApplicationRecord
  include Shared::DoesEntry

  mount_uploader :file, FileUploader

  validates :creator, :name, presence: true
  validates :file, presence: true

  def to_s
    name
  end

end
