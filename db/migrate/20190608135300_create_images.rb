class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.timestamps

      t.belongs_to :creator
      t.belongs_to :gallery
      t.string :name
      t.string :description

      t.string :file
    end
  end
end
