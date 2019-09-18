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

  assignable_values_for :repeating_interval, default: nil, allow_blank: :one_day? do
    ['daily', 'weekly', 'monthly', 'every_year']
  end

  has_defaults start_date: -> { Date.today }, end_date: -> { Date.today }

  def to_s
    name
  end

  def daily?
    repeating_interval == 'daily'
  end

  def weekly?
    repeating_interval == 'weekly'
  end

  def monthly?
    repeating_interval == 'monthly'
  end

  def every_year?
    repeating_interval == 'every_year'
  end

  def not_all_day?
    !all_day
  end

  def one_day?
    start_date == end_date
  end

  private

  # def valid_weekdays
  #   return if week_days.nil?
  #
  #   days = week_days.split(' ')
  #   days.each do |day|
  #     errors.add(:week_days, "#{day} is not a valid weekday") if !VALID_WEEKDAYS.include?(day)
  #   end
  # end

end
