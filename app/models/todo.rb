class Todo < ApplicationRecord
  include Shared::DoesEntry
  include Shared::DoesFlag[:done, default: false]

  scope :undone, ->  { where(done: false) }
  scope :ordered, ->  { order(done: :asc, priority: :desc, deadline: :desc) }

  validates :priority, presence: true

end
