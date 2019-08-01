class Calendar < ApplicationRecord
  include Shared::DoesEntry

  has_many :events

end
