class User::DrawerMapping < ApplicationRecord
  include Shared::DoesFlag[:selected, default: true]

  scope :selected, ->  { where(selected: true) }

  belongs_to :user
  belongs_to :drawer

  validates :user, uniqueness: { scope: :drawer }
end
