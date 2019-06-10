class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.timestamps
      t.belongs_to :creator
      t.references :category
      t.string :name
      t.string :description
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.string :repeating_interval
      t.string :week_days
    end
  end
end
