class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.timestamps

      t.belongs_to :creator
      t.belongs_to :calendar
      t.string :name
      t.string :description
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.boolean :all_day
      t.string :repeating_interval
    end
  end
end
