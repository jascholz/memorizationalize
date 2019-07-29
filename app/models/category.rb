class Category < ApplicationRecord
  self.table_name = 'categories'

  has_many :todos, dependent: :nullify
  has_many :galleries, dependent: :nullify
  has_many :events, dependent: :nullify
  has_many :ideas, dependent: :nullify
  has_many :notes, dependent: :nullify
  has_many :todos, dependent: :nullify
  has_one :calendar, dependent: :nullify

  has_many :category_mappings, class_name: 'User::CategoryMapping', dependent: :destroy
  has_many :users, through: :category_mappings

  validates :name, :priority, presence: true

  scope :ordered, ->  { order(priority: :desc, name: :desc) }

  def to_s
    if self.persisted?
      "#{name} (#{priority})"
    else
     name.presence || 'New Category'
    end
  end

end
