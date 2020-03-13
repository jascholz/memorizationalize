class United::UsersController < UnitedController

  skip_before_action :united_authentication

  def new
  end

  def create
    if params[:user][:name].present?
      redirect_to united_path
      cookies.encrypted[:united_user] = params[:user][:name] + ' - ' + ((Time.now.to_f * 1000).floor % 1000).to_s
    else
      @message = 'Sei kein Spielverderber und gib bitte einen Namen ein.'
      render new_united_user_path
    end
  end

end
