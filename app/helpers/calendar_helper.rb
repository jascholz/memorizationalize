module CalendarHelper

  def calendar(date, calendars)
    CalendarRenderer.new(date, calendars).render
  end

  private

  class CalendarRenderer
    include ActionView::Helpers
    include ActionView::Context
    include Rails.application.routes.url_helpers

    def initialize(date, calendars)
      @calendars = calendars
      @date = date

      first_day_of_month = @date.beginning_of_month
      last_day_of_month = @date.end_of_month
      @first_day = first_day_of_month.beginning_of_week
      @last_day = last_day_of_month.end_of_week

      @events = events_hash
    end

    def render
      month_tag
    end

    private

    def month_tag
      # first_week = @first_day.cweek
      # last_week = @last_day.cweek
      # if last_week < first_week
      #   last_week = num_weeks(@first_day.year) + last_week
      # end
      # weeks_count = last_week - first_week + 1

      @date_iterator = @first_day

      content_tag('div', class: 'calendar--month') do
        tags = ''.html_safe
        tags << week_days_tag
        6.times do
          tags << week_tag
        end
        tags
      end
    end

    def week_tag
      content_tag(:div, class: 'calendar--week') do
        tags = ''.html_safe
        tags << content_tag(:div, nil, class: 'calendar--week-number')
        7.times do
          tags << day_tag
          @date_iterator = @date_iterator + 1.day
        end
        tags << content_tag(:div, nil, class: 'calendar--week-number')
        tags
      end
    end

    def day_tag
      content_tag(:div, class: ['calendar--day', 'color-hover', ('-today' if @date_iterator == Date.today), ('other-month' if @date_iterator.month != @date.month)], day: @date_iterator.day, 'up-modal': '.form[event]') do
        tags = ''.html_safe
        tags << link_to(@date_iterator.day.to_s, new_event_path(date: @date_iterator), class: 'calendar--day-number', 'up-modal': '.modal')

        tags << content_tag(:div, class: 'calendar--events') do
          events_tags = ''.html_safe
          today_events = @events[@date_iterator]&.select{ |event| event.not_all_day? }
          today_events.to_a.each do |event|
            events_tags << link_to('', edit_event_path(event.id), class: 'calendar--event', 'colored': event.calendar.drawer.color, 'up-modal': '.modal')
          end
          events_tags
        end

        tags << content_tag(:div, class: 'calendar--all-day-events') do
          events_tags = ''.html_safe
          today_events = @events[@date_iterator]&.select(&:all_day?)
          today_events.to_a.each do |event|
            if event.all_day? && event.start_date <= @date_iterator && event.end_date >= @date_iterator
              events_tags << link_to('', edit_event_path(event.id), class: 'calendar--event', 'colored': event.calendar.drawer.color, 'up-modal': '.modal', 'all-day': true)
            end
          end
          events_tags
        end

        tags
      end
    end

    def events_hash
      events = @calendars.traverse_association(:events)
      events = events.where(start_date: @first_day..@last_day)
        .or(events.where(end_date: @first_day..@last_day))
        .or(events.where('start_date != end_date'))

      events_hash = {}
      events.each do |event|
        # rewrite: iterate through start_day to end_day and match events for that particular day
        # or at least implement jumps for the iteration.
        # The way it is right now, every query might iterate though several years, if the event goes for a longer time.
        (event.start_date..event.end_date).each do |day|
          if event.one_day? ||
            event.daily? ||
            (event.weekly? && event.start_date.wday == day.wday) ||
            (event.monthly? && event.start_date.mday == day.mday) ||
            (event.every_year? && event.start_date.month == day.month && event.start_date.mday == day.mday)

            events_hash[day] = [] if events_hash[day].nil?
            events_hash[day] << event
          end
        end
      end
      events_hash
    end

    def week_days_tag
      content_tag('div', class: 'calendar--week-days') do
        tags = ''.html_safe
        tags << content_tag('div', '', class: 'calendar--week-days-spacer')
        7.times do |offset|
          day = @date.beginning_of_week + offset.days
          tags << content_tag('div', I18n.t('date.day_names')[day.wday], class: 'calendar--week-days-day')
        end
        tags << content_tag('div', '', class: 'calendar--week-days-spacer')
        tags
      end
    end

    def num_weeks(year)
      Date.new(year, 12, 28).cweek
    end
  end
end
