module HeaderHelper

  def header_title
    user_signed_in? ? "#{current_user.first_name.titleize}s memorizationalize" : 'memorizationalize'
  end

  def header_title_mobile
    user_signed_in? ? "#{current_user.first_name.titleize}s memos" : 'memorizationalize'
  end

end
