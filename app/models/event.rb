class Event < ApplicationRecord
  serialize :start_time, Tod::TimeOfDay
  serialize :end_time, Tod::TimeOfDay

  include Shared::DoesEntry[domain: :calendar]
  include Shared::DoesFlag[:all_day, default: false]

  # VALID_WEEKDAYS = ['mon', 'the', 'wed', 'thu', 'fri', 'sat', 'sun']

  validates :start_date, presence: true
  validates :end_date, presence: true, if: :all_day?
  validates :start_time, :end_time, presence: true, if: :not_all_day?
  # validate :valid_weekdays

  assignable_values_for :repeating_interval, default: nil, allow_blank: true do
    ['daily', 'weekly', 'monthly']
  end

  has_defaults start_date: -> { Date.today }, end_date: -> { Date.today }

  private

  def not_all_day?
    !all_day
  end

  # def valid_weekdays
  #   return if week_days.nil?
  #
  #   days = week_days.split(' ')
  #   days.each do |day|
  #     errors.add(:week_days, "#{day} is not a valid weekday") if !VALID_WEEKDAYS.include?(day)
  #   end
  # end

end
