class Session < ActiveType::Object
  attribute :email, :string
  attribute :password, :string

  validates :email, presence: true
  validates :password, presence: true

end
