module Power::DoesImage
  as_trait do
    power :images do
      galleries.traverse_association(:images)
    end

    power :updatable_images do
      updatable_galleries.traverse_association(:images)
    end

    power :creatable_images do
      Image.none
    end
  end
end
