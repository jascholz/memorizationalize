class Bookmark < ApplicationRecord
  include Shared::DoesEntry

  validates :url, presence: true

  def to_s
    name
  end

end
