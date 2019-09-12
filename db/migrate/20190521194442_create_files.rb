class CreateFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :files do |t|
      t.timestamps

      t.belongs_to :creator
      t.belongs_to :drawer
      t.string :name
      t.string :description

      t.string :file
      t.string :folder
    end
  end
end
