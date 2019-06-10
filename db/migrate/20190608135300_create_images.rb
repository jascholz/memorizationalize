class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.timestamps
      t.belongs_to :creator
      t.string :name
      t.string :description

      t.string :file
      t.references :gallery
    end
  end
end
