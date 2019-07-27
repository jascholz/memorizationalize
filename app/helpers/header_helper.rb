module HeaderHelper

  def header_title
    user_signed_in? ? "#{current_user.first_name.titleize}s memorizationalize" : 'memorizationalize'
  end

end
