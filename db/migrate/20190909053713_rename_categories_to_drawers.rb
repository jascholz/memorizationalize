class RenameCategoriesToDrawers < ActiveRecord::Migration[5.2]
  def change
    rename_table :categories, :drawers
    rename_table :user_category_mappings, :user_drawer_mappings

    rename_column :todos, :category_id, :drawer_id
    rename_column :bookmarks, :category_id, :drawer_id
    rename_column :files, :category_id, :drawer_id
    rename_column :ideas, :category_id, :drawer_id
    rename_column :notes, :category_id, :drawer_id
    rename_column :galleries, :category_id, :drawer_id
    rename_column :user_drawer_mappings, :category_id, :drawer_id

    add_column :drawers, :color, :string
    add_column :drawers, :code, :string
  end
end
