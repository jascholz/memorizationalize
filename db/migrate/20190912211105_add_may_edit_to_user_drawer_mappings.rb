class AddMayEditToUserDrawerMappings < ActiveRecord::Migration[5.2]
  def change
    add_column :user_drawer_mappings, :may_edit, :boolean
  end
end
