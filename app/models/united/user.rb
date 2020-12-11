class United::User < ActiveType::Record[User]

  has_many :slots, :class_name => 'United::UserSlot', dependent: :destroy

  accepts_nested_attributes_for :slots

end
