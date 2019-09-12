class Drawer < ApplicationRecord
  has_many :todos, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :ideas, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :todos, dependent: :destroy
  has_many :galleries, dependent: :destroy
  has_many :calendars, dependent: :destroy

  has_many :user_mappings, class_name: 'User::DrawerMapping', dependent: :destroy
  has_many :users, through: :user_mappings

  validates :name, :color, presence: true
  has_defaults color: '#000000'

  scope :ordered, -> { order(priority: :desc, name: :desc) }

  def to_s
    name
  end

end
