class CreateDrawers < ActiveRecord::Migration[5.1]
  def change
    create_table :drawers do |t|
      t.timestamps

      t.string :name
      t.string :description
      t.string :invite_code
      t.string :color
      t.date :invitation_expiry
    end
  end
end
