class CreateGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :galleries do |t|
      t.timestamps
      t.belongs_to :creator
      t.references :category
      t.string :name
      t.string :description
    end
  end
end
