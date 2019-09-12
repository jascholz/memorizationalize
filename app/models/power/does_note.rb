module Power::DoesNote
  as_trait do
    power :notes do
      drawers.traverse_association(:notes)
    end

    power :updatable_notes do
      updatable_drawers.traverse_association(:notes)
    end

    power :creatable_notes do
      Note.none
    end
  end
end
