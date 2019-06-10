class Power
  include Consul::Power

  include Power::DoesCategory

  def initialize(user)
    @user = user
  end

end
