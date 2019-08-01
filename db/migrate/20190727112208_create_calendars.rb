class CreateCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :calendars do |t|
        t.timestamps
        t.belongs_to :creator
        t.references :category
        t.string :name
    end
  end
end
