module Shared::DoesEntry
  as_trait do |domain: :category|
    belongs_to :creator, class_name: 'User'
    belongs_to domain, optional: true

    validates :creator, :name, presence: true
    accepts_nested_attributes_for domain, reject_if: :reject_domain

    default_scope { where(category_id: User::CategoryMapping.selected.pluck(:category_id) + [nil]) }

    def reject_domain(params)
      category_id != 0
    end
  end
end
