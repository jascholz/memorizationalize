module Power::DoesDrawer
  as_trait do
    power :drawers do
      @user.drawers
    end

    power :updatable_drawers do
      @user.drawer_mappings.editable.traverse_association(:drawer)
    end

    power :creatable_drawers do
      Drawer.none
    end

    power :destroyable_drawers do
      drawers.joins(:user_mappings).group('drawers.id').having('count(user_mappings) = 1')
    end
  end
end
