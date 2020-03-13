class United::Vote < ApplicationRecord
  self.table_name = 'united_votes'

  belongs_to :poll, class_name: 'United::Poll'
  validates :voted_for, :user, presence: true

end
