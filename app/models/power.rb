class Power
  include Consul::Power

  include Power::DoesCalendar
  include Power::DoesCategory
  include Power::DoesGallery
  include Power::DoesUsers

  def initialize(user)
    @user = user
  end

  debugger

  def role
    @user.role
  end

end
