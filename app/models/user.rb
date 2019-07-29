class User < ApplicationRecord
  include Shared::DoesCalendarDate
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable #, :confirmable

  has_many :galleries, class_name: 'Gallery', foreign_key: :creator_id, dependent: :destroy, inverse_of: :creator
  has_many :category_mappings, dependent: :destroy
  has_many :categories, class_name: 'Category', through: :category_mappings

  accepts_nested_attributes_for :category_mappings, update_only: true

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true, on: :create

  def category_selected?(category)
    category_mappings.find_by(category: category)&.selected
  end

  def name
    [first_name, last_name].join(' ')
  end
end
