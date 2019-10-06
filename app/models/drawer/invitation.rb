class Drawer::Invitation < ActiveType::Object
  # include DoesCopyError[from: :drawer, to: :invite_code]

  attribute :invite_code, :string
  attribute :drawer_id, :integer
  belongs_to :drawer

  before_validation :find_drawer

  validates :invite_code, :drawer, presence: true

  def self.expire_invitations
    drawers = Drawer.where('invite_code IS NOT NULL').where('invitation_expiry < ?', Date.today)
    drawers.each do |drawer|
      drawer.update(invite_code: nil, invitation_expiry: nil)
    end
  end

  private

  def find_drawer
    self.drawer_id = Drawer.find_by(invite_code: invite_code)&.id
  end

end
