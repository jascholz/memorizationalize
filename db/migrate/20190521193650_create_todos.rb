class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.timestamps
      t.belongs_to :creator
      t.references :category
      t.string :name
      t.text :description

      t.date :deadline
      t.boolean :done
      t.integer :priority
    end
  end
end
