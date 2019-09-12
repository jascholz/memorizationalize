module Power::DoesCalendar
  as_trait do
    power :calendars do
      drawers.traverse_association(:calendars)
    end

    power :updatable_calendars do
      updatable_drawers.traverse_association(:calendars)
    end

    power :creatable_calendars do
      Calendar.none
    end
  end
end
