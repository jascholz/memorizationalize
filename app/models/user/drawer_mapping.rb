class User::DrawerMapping < ApplicationRecord
  include Shared::DoesFlag[:selected, default: true]
  include Shared::DoesFlag[:may_edit, default: false]

  scope :selected, ->  { where(selected: true) }
  scope :editable, ->  { where(may_edit: true) }

  belongs_to :user
  belongs_to :drawer

  validates :user, uniqueness: { scope: :drawer }
end
