module Power::DoesDrawer
  as_trait do
    power :drawers do
      @user.drawers.selected
    end

    power :updatable_drawers do
      @user.drawer_mappings.editable.traverse_association(:drawer).joins(:user_mappings).order('user_drawer_mappings.updated_at DESC')
    end

    power :creatable_drawers do
      Drawer.none # if @user.confirmed?
    end

    power :destroyable_drawers do
      @user.drawers.joins(:user_mappings).group('drawers.id').having('count(user_mappings) = 1')
    end
  end
end
