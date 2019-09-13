class User::DrawerMapping < ApplicationRecord
  include Shared::DoesFlag[:selected, default: true]
  include Shared::DoesFlag[:may_edit, default: false]

  scope :selected, ->  { where(selected: true) }
  scope :editable, ->  { where(may_edit: true) }
  scope :ordered_by_drawer, -> { joins(:drawer).order('name') }
  scope :ordered_by_user, -> { joins(:user).order('first_name, last_name') }

  belongs_to :user
  belongs_to :drawer

  validates :user, uniqueness: { scope: :drawer }
end
