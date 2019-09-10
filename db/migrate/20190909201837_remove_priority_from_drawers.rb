class RemovePriorityFromDrawers < ActiveRecord::Migration[5.2]
  def change
    add_column :drawers, :description, :integer
    remove_column :drawers, :priority, :integer
    rename_column :drawers, :code, :invitation_code
    add_column :drawers, :invitation_expiry_date, :date
  end
end
