class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.timestamps

      t.belongs_to :creator
      t.belongs_to :drawer
      t.string :name
      t.string :description

      t.decimal :post_it_x
      t.decimal :post_it_y
      t.decimal :post_it_angle
      t.boolean :post_it_flipped
    end
  end
end
