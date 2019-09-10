module Power::DoesCalendar
  as_trait do
    power :calendars do
      drawers.traverse_association(:calendar)
    end
  end
end
