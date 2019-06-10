class CreateBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmarks do |t|
      t.timestamps
      t.belongs_to :creator
      t.references :category
      t.string :name
      t.text :description

      t.string :url
    end
  end
end
