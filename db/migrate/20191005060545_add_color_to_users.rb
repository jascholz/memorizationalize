class AddColorToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :color, :string
    update "UPDATE users SET color = '#22181C'"
  end
end
