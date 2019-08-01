module Shared::DoesCalendarDate
  as_trait do
    validates :calendar_date, presence: true
    has_defaults calendar_date: -> { Date.today }

    def available_calendar_years
      (Date.today.year - 10)..(Date.today.year + 10)
    end
  end
end
