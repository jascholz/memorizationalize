class Todo < ApplicationRecord
  include Shared::DoesEntry
  include Shared::DoesFlag[:done, default: false]

  scope :undone, ->  { where(done: false) }
  scope :ordered, ->  { order(done: :asc, priority: :desc, deadline: :desc) }

  validates :priority, presence: true

  has_defaults deadline: -> { Date.today }

  def to_s
    name
  end

end
