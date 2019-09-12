module Power::DoesUser
  as_trait do
    power :users do
      if role == 'admin'
        User.all
      else
        @user.drawers.traverse_association(:user_mappings).traverse_association(:user)
      end
    end

    power :creatable_users do
      User.none
    end

    power :updatable_users do
      if role == 'admin'
        User.all
      else
        User.where(id: @user.id)
      end
    end
  end
end
