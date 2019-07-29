module Shared::DoesEntry
  as_trait do |domain: :category|
    belongs_to :creator, class_name: 'User'
    belongs_to domain, optional: true

    validates :creator, :name, presence: true
    accepts_nested_attributes_for domain, reject_if: :reject_domain

    def reject_domain(params)
      category_id != 0
    end
  end
end
