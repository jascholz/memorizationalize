class Power
  include Consul::Power

  include Power::DoesAttachment
  include Power::DoesBookmark
  include Power::DoesCalendar
  include Power::DoesDrawer
  include Power::DoesEvent
  include Power::DoesGallery
  include Power::DoesIdea
  include Power::DoesImage
  include Power::DoesNote
  include Power::DoesTodo
  include Power::DoesUser

  def initialize(user)
    @user = user
  end

  def user
    @user
  end

  def role
    @user.role
  end

end
