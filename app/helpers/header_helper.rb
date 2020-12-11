module HeaderHelper

  def header_title(united: false, mobile: false)
    if united
      title = 'United'
    else
      title = mobile ? 'memos' : 'memorizationalize'
    end
    user_signed_in? ? "#{current_user.first_name.titleize}s #{title}" : 'memorizationalize'
  end

end
