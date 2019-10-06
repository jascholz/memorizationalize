class Idea < ApplicationRecord
  include Shared::DoesEntry

  validates :text, presence: true

  def to_s
    name
  end

end
