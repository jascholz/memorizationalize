class Drawer::Invitation < ActiveType::Object
  attribute  :invite_code, :string
  attribute :drawer_id, :integer
  belongs_to :drawer

  before_validation :find_drawer

  validates :invite_code, :drawer, presence: true

  private

  def find_drawer
    @drawer_id = Drawer.find_by(invite_code: invite_code)
  end

end
