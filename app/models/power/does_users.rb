module Power::DoesUsers
  as_trait do
    power :users do
      if role == 'admin'
        User.all
      else
        User.where(id: @user.id)
      end
    end
  end
end
