class CreateUnitedSchedule < ActiveRecord::Migration[5.2]
  def up
    create_table :united_slots do |t|
      t.timestamps

      t.date :day
      t.time :start_time
      t.time :end_time
    end

    create_table :united_meetings do |t|
      t.timestamps

      t.belongs_to :slot
      t.string :name
      t.string :description
    end

    create_table :united_user_slots do |t|
      t.timestamps

      t.belongs_to :slot
      t.belongs_to :user
      t.boolean :available
    end

    (Date.today.beginning_of_week..Date.today.end_of_week).each do |day|
      %w[08:30 10:00 11:30 13:00 14:30 16:00 17:00 18:30 20:00 21:30 23:00].each do |timestamp|
        time = Tod::TimeOfDay.parse(timestamp)
        United::Slot.create(day: day, start_time: time, end_time: time + 90.minutes)
      end
    end
  end

  def down
    drop_table :united_slots
    drop_table :united_meetings
  end
end
