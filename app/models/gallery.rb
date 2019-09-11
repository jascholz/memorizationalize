class Gallery < ApplicationRecord
  self.table_name = 'galleries'
  include Shared::DoesEntry

  belongs_to :drawer
  has_many :images, dependent: :nullify

  def to_s
    if self.persisted?
      "#{name}"
    else
     name.presence || 'New Gallery'
    end
  end
end
