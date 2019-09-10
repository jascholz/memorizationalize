class Power
  include Consul::Power

  include Power::DoesCalendar
  include Power::DoesDrawer
  include Power::DoesGallery
  include Power::DoesUsers

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
