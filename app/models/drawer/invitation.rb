class Drawer::Invitation < ActiveType::Object
  attribute  :invitation_code, :string
  attribute :drawer_id, :integer
  belongs_to :drawer

  before_validation :find_drawer

  validates :invitation_code, :drawer, presence: true

  private

  def valid_code
    if Drawer.find_by(invitation_code: invitation_code).nil?
      errors.add(:code, 'Invalid')
    end
  end

  def find_drawer
    @drawer_id = Drawer.find_by(invitation_code: invitation_code)
  end

end
