class Drawer < ApplicationRecord
  has_many :attachments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :calendars, dependent: :destroy
  has_many :galleries, dependent: :destroy
  has_many :ideas, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :todos, dependent: :destroy
  has_many :user_mappings, class_name: 'User::DrawerMapping', dependent: :destroy
  has_many :users, through: :user_mappings

  validates :name, :color, presence: true
  validates :invite_code, uniqueness: true, allow_blank: true
  has_defaults color: '#000000'

  scope :ordered, -> { order(name: :desc) }
  scope :selected, -> { Power.current.user.drawer_mappings.selected.traverse_association(:drawer) }

  def to_s
    name
  end

  def generate_invite_code
    self.invite_code = SecureRandom.hex(4)
    self.invitation_expiry = 1.week.from_now
  end

end
