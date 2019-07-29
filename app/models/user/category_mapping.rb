class User::CategoryMapping < ApplicationRecord
  include Shared::DoesFlag[:selected, default: true]

  scope :selected, ->  { where(selected: true) }

  belongs_to :user
  belongs_to :category

  validates :user, uniqueness: { scope: :category }
end
