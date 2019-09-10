class Drawer < ApplicationRecord
  has_many :todos, dependent: :nullify
  has_many :galleries, dependent: :nullify
  has_many :events, dependent: :nullify
  has_many :ideas, dependent: :nullify
  has_many :notes, dependent: :nullify
  has_many :todos, dependent: :nullify
  has_one :calendar, dependent: :nullify

  has_many :user_mappings, class_name: 'User::DrawerMapping', dependent: :destroy
  has_many :users, through: :user_mappings

  validates :name, :color, presence: true
  has_defaults color: '#000000'

  scope :ordered, -> { order(priority: :desc, name: :desc) }

  def to_s
    if self.persisted?
      "#{name} (#{priority})"
    else
     name.presence || 'New Drawer'
    end
  end

end
