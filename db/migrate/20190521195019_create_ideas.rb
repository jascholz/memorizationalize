class CreateIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :ideas do |t|
      t.timestamps
      t.belongs_to :creator
      t.references :category
      t.string :name
      t.string :description
    end
  end
end
