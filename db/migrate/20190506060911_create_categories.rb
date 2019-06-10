class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.timestamps

      t.string :name
      t.integer :priority
    end
  end
end
