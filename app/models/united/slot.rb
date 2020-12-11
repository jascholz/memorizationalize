class United::Slot < ApplicationRecord
  self.table_name = 'united_slots'

  serialize :start_time, Tod::TimeOfDay
  serialize :end_time, Tod::TimeOfDay

  scope :for_day, ->(day) { where(day: day) }

  def duration
    Tod::Shift.new(start_time, end_time).duration / 60
  end

end
