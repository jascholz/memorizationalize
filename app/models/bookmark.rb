class Bookmark < ApplicationRecord
  include Shared::DoesEntry

  validates :url, presence: true, format: { with: URI.regexp }

  def to_s
    name
  end

end
