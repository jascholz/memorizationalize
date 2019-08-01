module Power::DoesCalendar
  as_trait do
    power :calendars do
      categories.traverse_association(:calendar)
    end
  end
end
