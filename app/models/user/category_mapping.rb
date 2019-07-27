class User::CategoryMapping < ApplicationRecord
  include Shared::DoesFlag[:selected, default: true]

  default_scope { joins(:category).order(priority: :desc, name: :desc) }
  scope :selected, ->  { where(selected: true) }

  belongs_to :user
  belongs_to :category

  validates :user, uniqueness: { scope: :category }
end
