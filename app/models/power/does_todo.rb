module Power::DoesTodo
  as_trait do
    power :todos do
      drawers.traverse_association(:todos)
    end

    power :updatable_todos do
      updatable_drawers.traverse_association(:todos)
    end

    power :creatable_todos do
      Todo.none
    end
  end
end
