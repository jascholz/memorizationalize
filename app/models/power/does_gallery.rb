module Power::DoesGallery
  as_trait do
    power :galleries do
      drawers.traverse_association(:galleries)
    end

    power :updatable_galleries do
      updatable_drawers.traverse_association(:galleries)
    end

    power :creatable_galleries do
      Gallery.none
    end
  end
end
