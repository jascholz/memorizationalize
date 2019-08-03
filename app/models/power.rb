class Power
  include Consul::Power

  include Power::DoesCalendar
  include Power::DoesCategory
  include Power::DoesGallery

  def initialize(user)
    @user = user
  end

end
