class CreateUserCategoryMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :user_category_mappings do |t|
      t.timestamps

      t.belongs_to :user
      t.belongs_to :category
      t.boolean :selected
    end
  end
end
