class CreateUserDrawerMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :user_drawer_mappings do |t|
      t.timestamps

      t.belongs_to :user
      t.belongs_to :drawer
      t.boolean :selected
    end
  end
end
