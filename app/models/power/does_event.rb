module Power::DoesEvent
  as_trait do
    power :events do
      calendars.traverse_association(:events)
    end

    power :updatable_events do
      updatable_calendars.traverse_association(:events)
    end

    power :creatable_events do
      Event.none
    end
  end
end
