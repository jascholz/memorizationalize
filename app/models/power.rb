class Power
  include Consul::Power

  include Power::DoesCategory
  include Power::DoesCalendar

  def initialize(user)
    @user = user
  end

end
