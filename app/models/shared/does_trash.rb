module Shared::DoesTrash
  as_trait do

    include Shared::DoesIndestructible
    include Shared::DoesFlag[:trashed, default: false]

    scope :active, -> { where(trashed: false) }
    scope :trashed, -> { where(trashed: true) }
    scope :with_trashed, ->(with_trashed) { with_trashed ? all : active }

    def active?
      !trashed?
    end

    def trash!
      update!(trashed: true)
    end
  end
end
