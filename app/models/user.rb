class User < ApplicationRecord
  include Shared::DoesCalendarDate
  include Shared::DoesFlag[:confirmed, default: false]
  include Shared::DoesTrash

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :galleries, class_name: 'Gallery', foreign_key: :creator_id, dependent: :destroy, inverse_of: :creator
  has_many :drawer_mappings, class_name: 'User::DrawerMapping', dependent: :destroy
  has_many :drawers, through: :drawer_mappings

  has_many :united_user_slots, :class_name => 'United::UserSlot', dependent: :destroy

  accepts_nested_attributes_for :drawer_mappings, update_only: true
  accepts_nested_attributes_for :united_user_slots

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true, on: :create
  validates :color, presence: true

  assignable_values_for :role, default: 'editor' do
    ['admin', 'editor', 'viewer']
  end

  has_defaults color: '#22181C'

  scope :unconfirmed, ->  { active.where(confirmed: false) }

  def drawer_selected?(drawer)
    drawer_mappings.find_by(drawer: drawer)&.selected
  end

  def name
    [first_name, last_name].join(' ')
  end

  def to_s
    name
  end

  def united_user?
    sign_up_message.downcase.include?('united')
  end

end
