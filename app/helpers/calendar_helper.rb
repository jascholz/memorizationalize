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
      first_week = @first_day.cweek
      last_week = @last_day.cweek
      weeks_count = last_week - first_week + 1

      @date_iterator = @first_day

      content_tag('div', class: 'calendar--month') do
        tags = ''.html_safe
        tags << week_days_tag
        weeks_count.times do
          tags << week_tag
        end
        tags
      end
    end

    def week_tag
      week = @date_iterator.cweek
      first_day_of_week = Date.today.beginning_of_week
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
      content_tag(:div, class: ['calendar--day', ('-today' if @date_iterator == Date.today)], day: @date_iterator.day, 'up-modal': '.form[event]') do
        tags = ''.html_safe
        tags << link_to(@date_iterator.day.to_s, new_event_path(date: @date_iterator), class: 'calendar--day-number', 'up-modal': '.modal')

        tags << content_tag(:div, class: 'calendar--events') do
          events_tags = ''.html_safe
          today_events = @events[@date_iterator]
          today_events.to_a.each do |event|
            events_tags << link_to('', edit_event_path(event.id), class: 'calendar--event', 'colored': event.calendar.drawer.color, 'up-modal': '.modal')
          end
          events_tags
        end

        tags
      end
    end

    def events_hash
      events = @calendars.traverse_association(:events)
      events = events.where(start_date: @first_day..@last_day).or(events.where(end_date: @first_day..@last_day))

      events_hash = {}
      events.each do |event|
        if events_hash[event.start_date]
          events_hash[event.start_date] << event
        else
          events_hash[event.start_date] = [event]
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
  end
end
