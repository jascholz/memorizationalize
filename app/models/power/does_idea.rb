module Power::DoesIdea
  as_trait do
    power :ideas do
      drawers.traverse_association(:ideas)
    end

    power :updatable_ideas do
      updatable_drawers.traverse_association(:ideas)
    end

    power :creatable_ideas do
      Idea.none
    end
  end
end
