module Shared::DoesEntry
  as_trait do |domain: :drawer|
    belongs_to :creator, class_name: 'User'
    belongs_to domain

    validates :creator, :name, presence: true
  end
end
