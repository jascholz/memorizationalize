class United::UsersController < United::BaseController

  power :users, map: {
      [:update] => :updatable_users,
  }, as: :user_scope

  def update
    load_user
    build_user
    save_user
  end

  private

  def load_user
    @user ||= ActiveType::cast(user_scope.find(params[:id]), United::User)
  end

  def build_user
    @user ||= ActiveType::cast(user_scope.build, United::User)
    @user.attributes = user_params
  end

  def save_user
    debugger
    if @user.save
      redirect_to united_path
    else
      render 'united/meetings/index'
    end
  end

  def user_params
    user_params = params[:user]
    permitted_user_params = [
      slots_attributes: [
        :id,
        :available,
      ]
    ]
    if user_params
      user_params.delete(:password) if user_params[:password]&.empty?
      user_params.permit(permitted_user_params)
    else
      {}
    end
  end

end
