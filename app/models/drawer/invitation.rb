class Drawer::Invitation < ActiveType::Object
  # include DoesCopyError[from: :drawer, to: :invite_code]

  attribute :invite_code, :string
  attribute :drawer_id, :integer
  belongs_to :drawer

  before_validation :find_drawer

  validates :invite_code, :drawer, presence: true

  def find_drawer
    self.drawer_id = Drawer.find_by(invite_code: invite_code).id
  end

end
