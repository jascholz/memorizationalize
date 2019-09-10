module Power::DoesDrawer
  as_trait do
    power :drawers do
      @user.drawers
    end
  end
end
