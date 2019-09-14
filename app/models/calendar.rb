class Calendar < ApplicationRecord
  include Shared::DoesEntry

  has_many :events

  def to_s
    name
  end

end
